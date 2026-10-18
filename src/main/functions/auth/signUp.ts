import 'reflect-metadata';

import { SignUpController } from '../../../application/controllers/auth/SignUpController';
import { lambdaHttpAdapter } from '../../adapters/lambdaHttpAdapter';

export const handler = lambdaHttpAdapter(SignUpController);
