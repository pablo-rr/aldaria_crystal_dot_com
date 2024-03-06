import LoggedInAuth from '../src/plugins/logged-in-auth.js'

async function bookDate(fastify, options) {
    let LIA = new LoggedInAuth(fastify, {});

    fastify.get("/v1/dates", async (request, reply) => {
        LIA.loggedOnly(request, reply);
        let result = await fastify.mysql.query('SELECT * FROM aldaria_crystal.bookings');
        reply.send(result[0]);
    });

    fastify.get("/v1/dates/:booking_date", async (request, reply) => {
        let result = await fastify.mysql.query('SELECT * FROM aldaria_crystal.bookings WHERE booking_date = \'' + request.params["booking_date"] + '\'');
        reply.send(result[0]);
    });

    fastify.get("/v1/dates/user/:user_email", async (request, reply) => {
        let result = await fastify.mysql.query('SELECT * FROM aldaria_crystal.bookings WHERE user_email = \'' + request.params["user_email"] + '\'');
        reply.send(result[0]);
    });

    fastify.post("/v1/dates/add", async (request, reply) => {
        let body = JSON.parse(request.body);
        if("booking_date" in body == false) { reply.code(400) }
        let result = await fastify.mysql.query('INSERT INTO aldaria_crystal.bookings(booking_date) VALUES(\'' + body["booking_date"] + '\')');
        reply.send(result);
    });

    fastify.post("/v1/dates/book", async (request, reply) => {
        let body = JSON.parse(request.body);
        if("booking_date" in body == false || "user_email" in body == false) { reply.code(400) }
        let result = await fastify.mysql.query('UPDATE aldaria_crystal.bookings SET user_email = \'' + body["user_email"] + '\', booking_description = \'' + body["booking_description"] + '\' WHERE user_email IS NULL AND booking_date = \'' + body["booking_date"] + '\'');
        reply.send(result);
    });

    fastify.post("/v1/dates/unbook", async (request, reply) => {
        let body = JSON.parse(request.body);
        if("booking_date" in body == false) { reply.code(400) }
        let result = await fastify.mysql.query('UPDATE aldaria_crystal.bookings SET user_email = ' + null + ', booking_description = ' + null + ' WHERE user_email IS NOT NULL AND booking_date = \'' + body["booking_date"] + '\'');
        reply.send(result);
    });

    fastify.post("/v1/dates/update", async (request, reply) => {
        let body = JSON.parse(request.body);
        if("current_booking_date" in body == false) { reply.code(400) }
        let result;
        if(body["new_booking_date"] != null){
            result = await fastify.mysql.query('UPDATE aldaria_crystal.bookings SET booking_date = \'' + body["new_booking_date"] + '\', booking_description = \'' + body["booking_description"] + '\' WHERE booking_date = \'' + body["current_booking_date"] + '\'');
        } else {
            result = await fastify.mysql.query('UPDATE aldaria_crystal.bookings SET booking_description = \'' + body["booking_description"] + '\' WHERE booking_date = \'' + body["current_booking_date"] + '\'');
        }
        reply.send(result);
    });

    fastify.post("/v1/dates/delete", async (request, reply) => {
        let body = JSON.parse(request.body);
        if("booking_date" in body == false) { reply.code(400) }
        let result = await fastify.mysql.query('DELETE FROM aldaria_crystal.bookings WHERE booking_date = \'' + body["booking_date"] + '\' AND user_email IS NULL');
        reply.send(result);
    });
}

export default bookDate;