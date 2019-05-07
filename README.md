# Setup

To setup SSO

  1. Generate cert & key
      * E.g. `openssl req -x509 -new -newkey rsa:2048 -nodes -subj '/C=US/ST=California/L=San Francisco/O=JankyCo/CN=Test Identity Provider' -keyout idp-private-key.pem -out idp-public-cert.pem -days 7300`
  1. Configure SSO settings in your application
      1. Add SSO Endpoint (default is `http://localhost:7000/saml/sso`)
      1. Copy the generated public cert to the application settings
  1. Start Saml Idp server with `npm run start`
      * For more configuration options see [`https://www.npmjs.com/package/saml-idp`](https://www.npmjs.com/package/saml-idp)