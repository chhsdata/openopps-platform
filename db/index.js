const _ = require('lodash');
const gen = require('postgres-gen');

// Cascading defaults.
// Look for openopps.dbConnection first.
// If unavailable, next reach for environment variables (process.env...).
// Finally, if no environment variables (in development), use basic defaults.
const config = _.defaults(
  openopps.dbConnection,
  {
    host: process.env.DB_HOST,
    db: process.env.DB_NAME,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    port: process.env.DB_PORT
  },
  {
    db: 'midas',
    user: 'midas',
    password: 'midas',
    port: '5432',
  }
);

module.exports = gen(config);
