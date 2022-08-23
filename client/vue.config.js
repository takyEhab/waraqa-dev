const path = require("path");

module.exports = {
  // Disable webpack sourcemap [Sourcecode]
  productionSourceMap: false,

  // The final project (npm run build) will be in public folder in backend
  outputDir: path.resolve(__dirname, "../backend/public"),

  devServer: {
    proxy: "http://localhost:3300",
  },
};
