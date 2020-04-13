const { environment } = require('@rails/webpacker')
const vue =  require('./loaders/vue')
const yml =  require('./loaders/yml')
const svg =  require('./loaders/svg')
const markdown =  require('./loaders/markdown')
const webpack = require('webpack')
const dotenv = require('dotenv')
const VueLoaderPlugin = require('vue-loader/lib/plugin')

const dotenvFiles = [
  `.env.${process.env.RAILS_ENV}.local`,
  '.env.local',
  `.env.${process.env.RAILS_ENV}`,
  '.env'
]
dotenvFiles.forEach((dotenvFile) => {
  dotenv.config({ path: dotenvFile, silent: true })
})

const resolver = {
  resolve: {
    alias: {
      'vue$': 'vue/dist/vue.esm.js'
    }
  }
}

environment.config.merge(resolver)
environment.loaders.append('svg', svg)
environment.loaders.append('vue', vue)
environment.loaders.append('yml', yml)
environment.loaders.append('markdown', markdown)
environment.plugins.prepend('Environment', new webpack.EnvironmentPlugin(JSON.parse(JSON.stringify(process.env))))
environment.plugins.append('VueLoaderPlugin', new VueLoaderPlugin())

module.exports = environment
