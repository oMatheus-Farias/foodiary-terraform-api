import { Injectable } from '@kernel/decorators/Injectable';

import { getCognitoClientEnv, getCognitoPoolEnv, getDynamoDbEnv } from './env';

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
}
