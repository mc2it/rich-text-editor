import {createRequire} from "node:module";
import {fileURLToPath} from "node:url";
import CKEditorUtils from "@ckeditor/ckeditor5-dev-utils";
import CKEditorWebpackPlugin from "@ckeditor/ckeditor5-dev-webpack-plugin";
import TerserWebpackPlugin from "terser-webpack-plugin";

/**
 * The bundler configuation.
 * @type {import("webpack").Configuration}
 */
export default {
	devtool: false,
	entry: fileURLToPath(new URL("../lib/index.js", import.meta.url)),
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
					postcssOptions: CKEditorUtils.styles.getPostCssConfig({
						minify: true,
						themeImporter: {
							themePath: createRequire(import.meta.url).resolve("@ckeditor/ckeditor5-theme-lark")
						}
					})
				}}
			]}
		]
	},
	optimization: {minimizer: [
		new TerserWebpackPlugin({
			extractComments: false,
			terserOptions: {
				ecma: 2020,
				format: {comments: false}
			}
		})
	]},
	output: {
		filename: "mc2it_rte.js",
		hashFunction: "xxhash64",
		library: "RichTextEditor",
		libraryExport: "RichTextEditor",
		libraryTarget: "window",
		path: fileURLToPath(new URL("../www/js", import.meta.url))
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
