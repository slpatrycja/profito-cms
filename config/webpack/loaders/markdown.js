module.exports = {
  test: /\.md$/,
  use: [
    {
      loader: 'vue-loader'
    },
    {
      loader: 'vue-markdown-loader/lib/markdown-compiler',
      options: {
        raw: true
      }
    }
  ]
}
