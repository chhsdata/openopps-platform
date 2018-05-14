require('app-module-path').addPath('lib/');
const _ = require('lodash');
const pgtools = require('pgtools');
const pgp = require('pg-promise')();
const path = require('path');

const config = {
  user: 'postgres',
  password: 'postgres',
  port: 5432,
  host: process.env.DB_HOST,
};

const dbConnection = {
  host: process.env.DB_HOST,
  db: 'midastest',
  user: 'midas',
  password: 'midas',
  port: '5432',
};

const dropSchema = 'DROP SCHEMA IF EXISTS public CASCADE;' +
  'CREATE SCHEMA IF NOT EXISTS public;' +
  'GRANT ALL ON SCHEMA public TO postgres;' +
  'GRANT ALL ON SCHEMA public TO public;';

_.extend(openopps, { dbConnection: dbConnection });

before(function (done) {
  console.log('Setting up test database...');
  pgtools.createdb(config, 'midastest', async (err, res) => {
    if(err && !err.message.match('duplicate database')) {
      console.log('Error creating test database', err);
      process.exit(-1);
    }
    _.extend(config, { database: 'midastest' });
    var db = pgp(config);
    if(err.message.match('duplicate database')) {
      db.query(dropSchema);
    }
    var filePath = path.join(__dirname, '../..', 'database', 'midastest.sql');
    data = new pgp.QueryFile(filePath, {minify: true});
    db.any(data).then(() => {
      pgp.end();
      console.log('Setup complete.');
    }).catch(err => {
      console.log('Error restoring dump file', err);
      process.exit(-1);
    });
    done();
  });
});

// after(async () => {
//   console.log('global teardown');
//   // var db = pgp(config);
//   // await db.query('DROP SCHEMA IF EXISTS public CASCADE;');
//   // await pgp.end();
// });
