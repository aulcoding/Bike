// esbuild.config.js
const esbuild = require("esbuild");

esbuild.build({
  entryPoints: ["app/javascript/application.js"],
  bundle: true,
  outdir: "app/assets/builds",
  minify: true,
  sourcemap: true,
  target: ["es2020"],
}).catch(() => process.exit(1));
