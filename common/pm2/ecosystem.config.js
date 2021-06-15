module.exports = {
  apps: [
    {
      name: "app",
      script: "./dist/main.js",
      exec_mode: "cluster",
      instances: "3", // depend on cpu numbers, (max, -1, number)
      max_memory_restart: "512M",
      max_restarts: 30,
      restart_delay: 1000,
      // cron_restart: "1 0 * * *" // a cron pattern to restart your app
      args: ["--color"],
      env: {
        NODE_ENV: "production",
        APP_ENV: "production",
      },
    },
  ],
};
