# Setup SSO server

## Running with `docker-compose`

The easiest way to run this is with `docker-compose`

Just run `docker-compose up` and you should be good to go.

## With Docker

1. Create config by running `cp src/config.defaults.js src/config.local.js`
1. Edit the `src/config.local.js` config as you wish [OPTIONAL]
1. Build docker image with `docker build . -t saml-idp`
1. Start image with `docker run -d --name saml-idp -p 7000:7000 saml-idp`
1. Get the public cert from inside the container
   - Output it to terminal: `docker exec -it saml-idp cat idp-public-cert.pem` OR
   - Copy it: `docker cp saml-idp:/usr/src/app/idp-public-cert.pem .`
     This builds on kirstu's saml-idp by adding docker containerization and automatic generation of a certificate and key pair on first startup.

## Without Docker

1. Create config by running `cp src/config.defaults.js src/config.local.js`
1. Edit the `src/config.local.js` config as you wish [OPTIONAL]
1. Generate cert & key
   - E.g. `openssl req -x509 -new -newkey rsa:2048 -nodes -subj '/C=US/ST=California/L=San Francisco/O=JankyCo/CN=Test Identity Provider' -keyout idp-private-key.pem -out idp-public-cert.pem -days 7300`
1. `npm install`
1. Start Saml Idp server with `npm run start`
   - For more configuration options see [`https://www.npmjs.com/package/saml-idp`](https://www.npmjs.com/package/saml-idp)

# Use the local SSO in your application

1. Configure SSO settings in your application
   1. Add SSO Endpoint (default is `http://localhost:7000/saml/sso`)
   1. Copy the generated public cert to the application settings
1. Add `issuer` to the root of the object exported from `config.local.js`
   - # `issuer` should point to the `SAML consumer URL` of your application
     `docker build -t saml-idp .`

To create a container of the built image and run it:

`docker run -it --name saml-idp saml-idp`

The above command outputs the generated public certificate to std-out. You may have to scroll up to reveal it. The certificate isn't renegerated on subsequent runs. It's still logged, though.

On subsequent starts, simply use:

`docker start saml-idp`

## Generating cert & key manually

1. Generate cert & key
   - E.g. `openssl req -x509 -new -newkey rsa:2048 -nodes -subj '/C=US/ST=California/L=San Francisco/O=JankyCo/CN=Test Identity Provider' -keyout idp-private-key.pem -out idp-public-cert.pem -days 7300`
1. Configure SSO settings in your application
   1. Add SSO Endpoint (default is `http://localhost:7000/saml/sso`)
   1. Copy the generated public cert to the application settings
1. Start Saml Idp server with `npm run start`
   - For more configuration options see [`https://www.npmjs.com/package/saml-idp`](https://www.npmjs.com/package/saml-idp)
