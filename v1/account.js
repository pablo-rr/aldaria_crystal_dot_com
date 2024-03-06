import { sha512, sha384, sha512_256, sha512_224 } from 'js-sha512';

async function account(fastify, options) {
    fastify.post("/v1/account/register", async (request, reply) => {
        let body = JSON.parse(request.body);
        if("user_email" in body == false || "user_password" in body == false) { reply.code(400) }
        let result = await fastify.mysql.query('INSERT INTO aldaria_crystal.users(user_email, user_password, user_join_date) VALUES(\'' + body["user_email"] + '\', \'' + sha512(body["user_password"]) + '\', CURRENT_TIMESTAMP)');
        reply.code(200);
    });

    fastify.post("/v1/account/login", async (request, reply) => {
        let body = JSON.parse(request.body);
        if("user_email" in body == false || "user_password" in body == false) { reply.code(400) }
        let result = await fastify.mysql.query('SELECT user_email, COUNT(1) AS results FROM aldaria_crystal.users WHERE user_email = \'' + body["user_email"] + '\' AND user_password = \'' + sha512(body["user_password"]) + '\'');
        console.log(result);

        if(result[0][0]["results"] == 1){
            let token = fastify.jwt.sign({ user_email: result[0][0]["user_email"] });
            reply
                .setCookie('jwt_token', token, {
                    //domain: 'aldariacrystal.com'
                    domain: 'localhost'
                    ,path: '/'
                    ,signed: true
                    ,secure: true
                    ,httpOnly: true
                })
                .code(200);
        } else {
            reply.code(400);
        }
    });
}

export default account;