module.exports = {
  entry: './entry.js',
  module: {
    loaders: [
      {
        test: /\.js$/,
        loader: 'babel',
        exclude: /(bower_components|node_modules)/,
        query: {
          presets: ['latest']
        }
      },
      {
        test: /\.hbs$/,
        loader: 'handlebars-loader'
      }
    ]
  },
  plugins: [
    new (require('webpack-dashboard/plugin'))()
  ],
  output: {
    path: __dirname,
    filename: 'bundle.js'
  },
  node: {
    fs: 'empty'
  }
}
