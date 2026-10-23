import 'reflect-metadata';

import { ForgotPasswordController } from '@application/controllers/auth/ForgotPasswordController';

import { lambdaHttpAdapter } from '../../adapters/lambdaHttpAdapter';

export const handler = lambdaHttpAdapter(ForgotPasswordController);
