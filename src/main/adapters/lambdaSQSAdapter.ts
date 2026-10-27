import type { IQueueConsumer } from '@application/contracts/IQueueConsumer';
import { Registry } from '@kernel/di/Registry';
import type { Constructor } from '@shared/types/Constructor';
import type { SQSHandler } from 'aws-lambda';

export function lambdaSQSAdapter(queueConsumerImpl: Constructor<IQueueConsumer<any>>): SQSHandler {
  return async (event) => {
    const queueConsumer = Registry.getInstance().resolver(queueConsumerImpl);

    await Promise.all(
      event.Records.map(async (record) => {
        const message = JSON.parse(record.body);

        await queueConsumer.process(message);
      }),
    );
  };
}
