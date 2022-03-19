const {join} = require("node:path");
const {styles} = require("@ckeditor/ckeditor5-dev-utils");
const CKEditorWebpackPlugin = require("@ckeditor/ckeditor5-dev-webpack-plugin");

module.exports = {
	entry: join(__dirname, "../src/index.js"),
	module: {
		rules: [
			{test: /\.svg$/, use: ["raw-loader"]},
			{test: /\.css$/, use: [
				{loader: "style-loader", options: {
					attributes: {"data-cke": true},
					injectType: "singletonStyleTag"
				}},
				"css-loader",
				{loader: "postcss-loader", options: {
					postcssOptions: styles.getPostCssConfig({
						minify: true,
						themeImporter: {themePath: require.resolve("@ckeditor/ckeditor5-theme-lark")}
					})
				}}
			]}
		]
	},
	optimization: {minimize: false},
	output: {
		filename: "mc2it_rte.js",
		hashFunction: "xxhash64",
		library: "RichTextEditor",
		libraryExport: "RichTextEditor",
		libraryTarget: "window",
		path: join(__dirname, "../lib")
	},
	performance: {hints: false},
	plugins: [
		new CKEditorWebpackPlugin({
			additionalLanguages: "all",
			language: "fr",
			outputDirectory: "i18n"
		})
	]
};
