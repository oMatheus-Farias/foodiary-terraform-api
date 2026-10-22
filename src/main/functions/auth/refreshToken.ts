import 'reflect-metadata';

import { RefreshTokenController } from '@application/controllers/auth/RefreshTokenController';

import { lambdaHttpAdapter } from '../../adapters/lambdaHttpAdapter';

export const handler = lambdaHttpAdapter(RefreshTokenController);
