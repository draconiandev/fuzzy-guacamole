// Note: You must restart bin/webpack-watcher for changes to take effect

const webpack = require('webpack')
const merge = require('webpack-merge')
const configureHotModuleReplacement = require('webpacker-react/configure-hot-module-replacement')

const sharedConfig = require('./shared.js')
sharedConfig.config = configureHotModuleReplacement(sharedConfig.config)

module.exports = merge(sharedConfig.config, {
  devtool: 'sourcemap',

  stats: {
    errorDetails: true
  },

  output: {
    pathinfo: true
  },

  plugins: [
    new webpack.LoaderOptionsPlugin({
      debug: true
    })
  ]
})
