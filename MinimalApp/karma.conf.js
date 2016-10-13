module.exports = function(config) {
  config.set({
    browsers: ['PhantomJS'],
    frameworks: ['mocha'],
    reporters: ['mocha'],
    reportSlowerThan: 5,
    files: [
      './src/*'
    ],
    preprocessors: {
      './src/*': ['babel', 'webpack']
    },
    webpack: require('./webpack.config.js'),
    webpackMiddleware: {
      noInfo: true
    },
    plugins: [
      require('karma-babel-preprocessor'),
      require('karma-webpack'),
      require('karma-mocha'),
      require('karma-mocha-reporter'),
      require('karma-phantomjs-launcher')
    ]
  });
};
