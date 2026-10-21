import 'reflect-metadata';

import { CreateMealController } from '@application/controllers/meals/CreateMealController';

import { lambdaHttpAdapter } from '../../adapters/lambdaHttpAdapter';

export const handler = lambdaHttpAdapter(CreateMealController);
