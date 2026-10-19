# Terraform domain organization design

## Purpose

Organize the Terraform configuration to reflect the reference project's separation of functions by domain and resources by infrastructure capability, while keeping the current `dev` deployment isolated and preparing a consistent path for additional environments later.

This design preserves the existing AWS resources and their behavior. It does not create a production environment or add AWS resources.

## Current and reference structures

The Serverless reference composes function files by domain (`auth`, `meals`, `accounts`, `profiles`, and `goals`) and resource files by capability (`UserPool`, `MainTable`, `MealsBucket`, `MealsQueue`, and related resources). Shared provider settings live in `serverless.yml` and `sls/config/`.

The current Terraform root is `infra/environments/dev`. It groups resources mainly by AWS resource type. It already has a reusable `infra/modules/lambda` module that creates a dedicated execution role and log group for each Lambda.

## Chosen structure

Keep `infra/environments/dev` as the root module for the `dev` state. It composes focused child modules and owns environment-specific backend and provider configuration.

```text
infra/
├── bootstrap/
├── environments/
│   └── dev/
│       ├── backend.tf
│       ├── dev.auto.tfvars
│       ├── locals.tf
│       ├── main.tf
│       ├── outputs.tf
│       ├── providers.tf
│       ├── variables.tf
│       └── versions.tf
└── modules/
    ├── api_gateway/
    │   ├── main.tf
    │   ├── outputs.tf
    │   ├── terraform.tf
    │   └── variables.tf
    ├── auth/
    │   ├── cognito.tf
    │   ├── lambda.tf
    │   ├── lambda_package.tf
    │   ├── lambda_permissions.tf
    │   ├── routes.tf
    │   ├── outputs.tf
    │   ├── terraform.tf
    │   └── variables.tf
    └── lambda/
        ├── main.tf
        ├── outputs.tf
        ├── terraform.tf
        └── variables.tf
```

Only modules needed by the current `dev` infrastructure will be created. Modules for future domains or AWS services will be added when those features are implemented, rather than as empty placeholders.

### Module responsibilities

- `api_gateway` owns the shared HTTP API, stage, and API access log group. It exposes the API ID, execution ARN, stage name, and invoke URL needed by domain modules.
- `auth` owns the Cognito user pool and client, auth Lambda package data, the `sign_up` and `pre_sign_up_trigger` Lambda instances, their domain routes and invocation permissions. It receives the API Gateway identifiers from the environment root.
- `lambda` remains the reusable per-function building block for Lambda, dedicated execution role, function log group, and least-privilege log-write policy.
- The environment root owns backend configuration, provider configuration, shared version constraints, environment input, composition of `api_gateway` and `auth`, and top-level outputs.

Future modules such as `meals`, `accounts`, `profiles`, and `goals` can own their domain functions, routes, and event-source integrations. Shared data or messaging resources will be placed at the boundary that best represents their ownership and consumers; no broad shared execution role will be introduced merely to mirror the Serverless reference.

## Environment model

Only `dev` will exist after this refactor. Its current S3 state key remains `foodiary-api/dev/terraform.tfstate`.

The shared modules will derive resource names and tags from the environment input. When production is needed, a separate environment root and a unique backend state key will be added. The S3 backend key is static backend configuration and cannot interpolate an ordinary Terraform input variable, so adding an environment requires explicit backend isolation in addition to selecting the environment name.

## State and migration safety

Moving resources from the current root into child modules changes Terraform addresses even when the AWS resources are unchanged. The refactor will add root-level `moved` blocks mapping the existing addresses to the new module addresses. Existing historical `moved` blocks will be preserved.

Before any apply, the implementation plan must:

1. Read the current remote state and record its addresses.
2. Add and review all address mappings.
3. Run `terraform fmt`, `terraform validate`, and a plan against the existing `dev` state.
4. Stop if the plan proposes unplanned AWS creates, replacements, or destroys.

An apply is outside the implementation scope of this refactor. The user will review the plan and execute any apply.

## Security and cost

- Keep one execution role per Lambda. Do not copy the reference's broad shared IAM role into Terraform.
- Preserve current Cognito and API Gateway invocation permissions and their source scopes.
- Do not add production resources or placeholders.
- The intended refactor changes Terraform organization and state addresses only; it must not create new AWS resources or increase AWS service usage.

## Verification and completion criteria

- The Terraform file layout reflects shared API Gateway infrastructure and the `auth` domain.
- Environment-specific state configuration remains in the `dev` root.
- Existing resource addresses are migrated with `moved` blocks rather than treated as new resources.
- Formatting and validation succeed.
- The plan contains no unplanned creates, replacements, or destroys; any provider-reported in-place changes are reviewed before considering the plan safe.
- No apply is run as part of this refactor.

## References

- Reference Serverless composition: <https://github.com/oMatheus-Farias/foodiary-api/blob/main/serverless.yml>
- Reference function grouping: <https://github.com/oMatheus-Farias/foodiary-api/tree/main/sls/functions>
- Reference resource grouping: <https://github.com/oMatheus-Farias/foodiary-api/tree/main/sls/resources>
- Terraform file and module behavior: <https://developer.hashicorp.com/terraform/language/files>
- Terraform style and environment layout guidance: <https://developer.hashicorp.com/terraform/language/style>
- Terraform resource address refactoring: <https://developer.hashicorp.com/terraform/language/modules/develop/refactoring>
