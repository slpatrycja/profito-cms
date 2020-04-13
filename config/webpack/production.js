process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')

if (process.env.CDN_HOST) {
  const fileLoader = environment.loaders.get('file')
  fileLoader.use[0].options.publicPath = '//' + process.env.CDN_HOST + '/packs'
}

module.exports = environment.toWebpackConfig()
