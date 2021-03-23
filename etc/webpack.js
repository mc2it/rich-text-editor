const {styles} = require("@ckeditor/ckeditor5-dev-utils");
const CKEditorPlugin = require("@ckeditor/ckeditor5-dev-webpack-plugin");
const {join} = require("path");
const TerserPlugin = require("terser-webpack-plugin");

module.exports = {
	entry: join(__dirname, "../var/editor.js"),
	mode: process.env.NODE_ENV,
	module: {
		rules: [
			{test: /\.svg$/, use: "raw-loader"},
			{test: /\.css$/, use: [
				{loader: "style-loader", options: {injectType: "singletonStyleTag"}},
				{loader: "postcss-loader", options: styles.getPostCssConfig({
					minify: process.env.NODE_ENV == "production",
					themeImporter: {themePath: require.resolve("@ckeditor/ckeditor5-theme-lark")}
				})}
			]}
		]
	},
	optimization: {
		minimizer: [new TerserPlugin({
			extractComments: false,
			terserOptions: {output: {comments: false}}
		})]
	},
	output: {
		filename: "editor.js",
		library: "RichTextEditor",
		libraryExport: "RichTextEditor",
		libraryTarget: "window",
		path: join(__dirname, "../build")
	},
	performance: {hints: false},
	plugins: [
		new CKEditorPlugin({
			additionalLanguages: "all",
			language: "fr",
			outputDirectory: "i18n"
		})
	]
};
