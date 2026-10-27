import type { IFileEventHandler } from '@application/contracts/IFileEventHandler';
import { Registry } from '@kernel/di/Registry';
import type { Constructor } from '@shared/types/Constructor';
import type { S3Handler } from 'aws-lambda';

export function lambdaS3Adapter(eventHandlerImpl: Constructor<IFileEventHandler>): S3Handler {
  return async (event) => {
    const eventHandler = Registry.getInstance().resolver(eventHandlerImpl);

    const responses = await Promise.allSettled(
      event.Records.map((record) =>
        eventHandler.handle({
          fileKey: record.s3.object.key,
        }),
      ),
    );

    const failedEvents = responses.filter((response) => response.status === 'rejected');

    for (const event of failedEvents) {
      // eslint-disable-next-line no-console
      console.error(JSON.stringify(event.reason, null, 2));
    }
  };
}
