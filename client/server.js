const express = require('express');
const morgan = require('morgan');
const helmet = require('helmet');
const jwt = require('express-jwt');
const jwksRsa = require('jwks-rsa');
const { join } = require('path');
const authConfig = require('./auth_config.json');
const request = require("request");

const app = express();

if (!authConfig.domain || !authConfig.audience) {
  throw 'Please make sure that auth_config.json is in place and populated';
}

app.use(morgan('dev'));
app.use(helmet());

const checkJwt = jwt({
  secret: jwksRsa.expressJwtSecret({
    cache: true,
    rateLimit: true,
    jwksRequestsPerMinute: 5,
    jwksUri: `https://${authConfig.domain}/.well-known/jwks.json`
  }),

  audience: authConfig.audience,
  issuer: `https://${authConfig.domain}/`,
  algorithm: ['RS256']
});

app.get('/api/external', checkJwt, (req, res) => {

  var options = {
    method: 'GET',
    url: `https://${authConfig.domain}/userinfo`,
    headers: {authorization: req.headers.authorization}
  };

  request(options, function (error, response, body) {
    if (error) throw new Error(error);
  
    res.send(body);
  });

  
});

if (process.env.NODE_ENV === 'production') {
  app.use(express.static(join(__dirname, 'dist', 'login-demo')));

  app.get('/*', (_, res) => {
    res.sendFile(join(__dirname, 'dist', 'login-demo', 'index.html'));
  });
}

const port = process.env.NODE_ENV === 'production' ? 3000 : 3001;

app.listen(port, () => console.log(`Server started on port ${port}`));
