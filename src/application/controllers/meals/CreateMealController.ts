import { Controller } from '@application/contracts/Controller';
import { Injectable } from '@kernel/decorators/Injectable';
import { v7 as uuidv7 } from 'uuid';

@Injectable()
export class CreateMealController extends Controller<'private', CreateMealController.Response> {
  protected override async handle(): Promise<Controller.Response<CreateMealController.Response>> {
    return {
      statusCode: 201,
      body: {
        mealId: uuidv7(),
      },
    };
  }
}

export namespace CreateMealController {
  export type Response = {
    mealId: string;
  };
}
