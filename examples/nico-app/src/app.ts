import nico from "@blastz/nico";

nico.init({
  routes: {
    "GET /test": {
      controller: async (ctx) => {
        return (ctx.body = {
          success: true,
          env: process.env.APP_ENV,
        });
      },
    },
  },
});

nico.start(1415);
