import 'reflect-metadata';

import { HelloController } from '../../application/controllers/HelloController';
import { lambdaHttpAdapter } from '../adapters/lambdaHttpAdapter';

export const handler = lambdaHttpAdapter(HelloController);
