const utils = require('@ckeditor/ckeditor5-dev-utils');
const CKEditorPlugin = require('@ckeditor/ckeditor5-dev-webpack-plugin');
const BabelMinifyPlugin = require('babel-minify-webpack-plugin');
const {resolve} = require('path');

module.exports = {
  entry: resolve(__dirname, '../lib/index.js'),
  mode: 'production',
  module: {
    rules: [
      {test: /\.svg$/, use: 'raw-loader'},
      {test: /\.css$/, use: [
        {loader: 'style-loader', options: {injectType: 'singletonStyleTag'}},
        {loader: 'postcss-loader', options: utils.styles.getPostCssConfig({
          minify: true,
          themeImporter: {themePath: require.resolve('@ckeditor/ckeditor5-theme-lark')}
        })}
      ]}
    ]
  },
  optimization: {
    minimizer: [new BabelMinifyPlugin({}, {comments: false})]
  },
  output: {
    filename: 'editor.js',
    library: 'RichTextEditor',
    libraryExport: 'RichTextEditor',
    libraryTarget: 'window',
    path: resolve(__dirname, '../build')
  },
  performance: {hints: false},
  plugins: [
    new CKEditorPlugin({
      additionalLanguages: 'all',
      language: 'fr',
      outputDirectory: 'i18n'
    })
  ]
};