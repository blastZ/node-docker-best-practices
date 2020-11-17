const nico = require("@blastz/nico").default;

nico.init({
  routes: {
    "GET /users": {
      controller: (ctx) => {
        return (ctx.body = {
          success: true,
          data: [],
          message: "execute success",
        });
      },
    },
  },
  logger: {
    consoleLevel: "trace",
  },
});

nico.start(1314);
