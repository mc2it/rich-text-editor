import utils from '@ckeditor/ckeditor5-dev-utils';
import CKEditorPlugin from '@ckeditor/ckeditor5-dev-webpack-plugin';
import BabelMinifyPlugin from 'babel-minify-webpack-plugin';
import {resolve} from 'path';

module.exports = {
  entry: resolve(__dirname, '../lib/index.js'),
  mode: 'production',
  module: {
    rules: [
      {test: /\.svg$/, use: 'raw-loader'},
      {test: /\.css$/, use: [
        {loader: 'style-loader', options: {singleton: true}},
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
