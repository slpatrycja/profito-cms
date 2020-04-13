module.exports = {
  test: /\.svg$/,
  use: [
    {
      loader: 'svg-url-loader',
      options: {
        stripdeclarations: true,
        noquotes: true
      }
    },
  ]
};
