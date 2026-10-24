import { Injectable } from '@kernel/decorators/Injectable';

import { getCDNEnv, getCognitoClientEnv, getCognitoPoolEnv, getDynamoDbEnv, getS3Env } from './env';

@Injectable()
export class AppConfig {
  get auth(): AppConfig.Auth {
    return {
      cognito: {
        get client() {
          const env = getCognitoClientEnv();

          return {
            id: env.COGNITO_CLIENT_ID,
            secret: env.COGNITO_CLIENT_SECRET,
          };
        },
        get pool() {
          const env = getCognitoPoolEnv();

          return {
            id: env.COGNITO_POOL_ID,
          };
        },
      },
    };
  }

  get database(): AppConfig.Database {
    return {
      dynamodb: {
        get mainTableName() {
          const env = getDynamoDbEnv();

          return env.MAIN_TABLE_NAME;
        },
      },
    };
  }

  get storage(): AppConfig.Storage {
    return {
      s3: {
        get mealsBucket() {
          const env = getS3Env();

          return env.MEALS_BUCKET;
        },
      },
    };
  }

  get cdns(): AppConfig.CDNs {
    return {
      get mealsCDN() {
        const env = getCDNEnv();

        return env.MEALS_CDN_DOMAIN_NAME;
      },
    };
  }
}

export namespace AppConfig {
  export type Auth = {
    cognito: {
      client: {
        id: string;
        secret: string;
      };
      pool: {
        id: string;
      };
    };
  };

  export type Database = {
    dynamodb: {
      mainTableName: string;
    };
  };

  export type Storage = {
    s3: {
      mealsBucket: string;
    };
  };

  export type CDNs = {
    mealsCDN: string;
  };
}
