module.exports = {
  apps: [
    {
      name: "nico-app",
      script: "./dist/app.js",
      exec_mode: "fork",
      watch: ["./dist"],
      watch_delay: 1000,
      watch_options: {
        followSymlinks: false,
      },
      max_restarts: 10,
      args: ["--color"],
      env: {
        NODE_ENV: "local",
        APP_ENV: "local",
      },
    },
  ],
};
