module.exports = {
  entry: "./entry.js",
  module: {
    loaders: [
      {
        test: /\.js$/,
        loader: 'babel',
        exclude: /(bower_components|node_modules)/,
        query: {
          presets: ['latest']
        }
      }
    ]
  },
  plugins: [
    new (require('webpack-dashboard/plugin'))
  ],
  output: {
    path: __dirname,
    filename: "bundle.js"
  }
}
