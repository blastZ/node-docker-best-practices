module.exports = {
  apps: [
    {
      name: "nico-app",
      script: "./dist/app.js",
      exec_mode: "fork",
      env_test: {
        APP_ENV: "test",
      },
      env_production: {
        APP_ENV: "production",
      },
    },
  ],
};
