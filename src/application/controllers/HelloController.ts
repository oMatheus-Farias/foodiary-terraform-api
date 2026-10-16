import { Controller } from '@application/contracts/Controller';
import { Injectable } from '@kernel/decorators/Injectable';
import { Schema } from '@kernel/decorators/Schema';
import { z } from 'zod';

const HelloSchema = z.object({
  name: z.string('"name" must be a string').trim().min(1, '"name" cannot be empty'),
});

type HelloBody = z.infer<typeof HelloSchema>;

@Injectable()
@Schema(HelloSchema)
export class HelloController extends Controller<'public', HelloController.Response> {
  protected override async handle({
    body,
  }: Controller.Request<'public', HelloBody>): Promise<
    Controller.Response<HelloController.Response>
  > {
    const { name } = body;

    return {
      statusCode: 200,
      body: {
        message: `Hello, ${name}!`,
      },
    };
  }
}

export namespace HelloController {
  export type Response = {
    message: `Hello, ${string}!`;
  };
}
