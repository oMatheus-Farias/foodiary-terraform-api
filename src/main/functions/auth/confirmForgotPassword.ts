import 'reflect-metadata';

import { ConfirmForgotPasswordController } from '@application/controllers/auth/ConfirmForgotPasswordController';

import { lambdaHttpAdapter } from '../../adapters/lambdaHttpAdapter';

export const handler = lambdaHttpAdapter(ConfirmForgotPasswordController);
