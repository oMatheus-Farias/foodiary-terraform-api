import { Column } from '@react-email/column';
import { Body, Head } from '@react-email/components';
import { Heading } from '@react-email/heading';
import { Html } from '@react-email/html';
import { Row } from '@react-email/row';
import { Section } from '@react-email/section';
import { Text } from '@react-email/text';

interface IForgotPasswordProps {
  confirmationCode: string;
}

export default function ForgotPassword({ confirmationCode }: IForgotPasswordProps) {
  return (
    <Html lang="pt-BR">
      <Head />
      <Body style={{ margin: '0', fontFamily: 'Arial, Helvetica, sans-serif' }}>
        <Section>
          <Row>
            <Column style={{ textAlign: 'center' }}>
              <Heading as="h1" style={{ fontSize: '24px', fontWeight: 700, margin: '24px 0 16px' }}>
                Recupere a sua conta
              </Heading>
              <Heading
                as="h2"
                style={{
                  color: '#86868e',
                  fontSize: '16px',
                  fontWeight: 400,
                  lineHeight: '20px',
                  margin: '0',
                }}
              >
                Resete a sua senha e volte ao foco 💪
              </Heading>
            </Column>
          </Row>

          <Row>
            <Column style={{ textAlign: 'center' }}>
              <span
                style={{
                  backgroundColor: '#e5e7eb',
                  borderRadius: '8px',
                  display: 'inline-block',
                  fontSize: '30px',
                  fontWeight: 700,
                  letterSpacing: '16px',
                  marginTop: '24px',
                  padding: '16px 32px',
                }}
              >
                {confirmationCode}
              </span>
            </Column>
          </Row>

          <Row>
            <Column>
              <Text
                style={{
                  color: '#86868e',
                  fontSize: '14px',
                  lineHeight: '20px',
                  margin: '40px auto 0',
                  maxWidth: '320px',
                  textAlign: 'center',
                }}
              >
                Se você não solicitou esta troca, fique tranquilo(a), sua conta continua segura.
              </Text>
            </Column>
          </Row>
        </Section>
      </Body>
    </Html>
  );
}

ForgotPassword.PreviewProps = {
  confirmationCode: '123456',
};
