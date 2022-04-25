import {createRequire} from "node:module";
import {join} from "node:path";
import {fileURLToPath} from "node:url";
import CKEditorUtils from "@ckeditor/ckeditor5-dev-utils";
import CKEditorWebpackPlugin from "@ckeditor/ckeditor5-dev-webpack-plugin";
import TerserWebpackPlugin from "terser-webpack-plugin";

const basePath = fileURLToPath(new URL("..", import.meta.url));
export default {
	devtool: false,
	entry: join(basePath, "lib/index.js"),
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
		path: join(basePath, "www/js")
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
