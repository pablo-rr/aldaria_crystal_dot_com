// Fastify
import Fastify from 'fastify'
import fastifyJwt from '@fastify/jwt';
import fastifyCookie from '@fastify/cookie';
import { fastifyMysql } from '@fastify/mysql';
// Other plugins
import 'dotenv/config'
// Routes
import bookings from './v1/bookings.js';
import account from './v1/account.js';

const fastify = Fastify({
  logger: true
});

fastify.register(fastifyMysql, {
  promise: true
  ,connectionString: 'mysql://root@localhost/mysql'
});

fastify.register(fastifyCookie, {
  secret: process.env.COOKIES_SECRET
})

fastify.register(fastifyJwt, {
  secret: process.env.JWT_SECRET
})

fastify.register(account);
fastify.register(bookings);

// Run the server!
fastify.listen({ port: 7164 }, function (err, address) {
  if (err) {
    fastify.log.error(err)
    process.exit(1)
  }
  // Server is now listening on ${address}
});