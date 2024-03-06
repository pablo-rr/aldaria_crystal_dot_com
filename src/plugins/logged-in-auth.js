class LoggedInAuth {
    constructor(fastify, options) {
        this.fastify = fastify;
        this.options = options;
    }
    
    loggedOnly(request, reply, errorCode = 403) {
        if('jwt_token' in request.cookies == false) { reply.code(errorCode); }
        console.log("TOKEN", request.cookies['jwt_token']);
        //console.log("VERIF", this.fastify.jwt.verify(request.cookies['jwt_token']));

        this.fastify.jwt.verify(request.cookies['jwt_token'], (err, decoded) => {
            if (err) console.log(err)
            console.log(decoded)
        })
    }
}

export default LoggedInAuth;