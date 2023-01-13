// @ts-nocheck
import {Alignment} from "@ckeditor/ckeditor5-alignment";
import {Autoformat} from "@ckeditor/ckeditor5-autoformat";
import {Bold, Italic, Strikethrough, Underline} from "@ckeditor/ckeditor5-basic-styles";
import {ClassicEditor} from "@ckeditor/ckeditor5-editor-classic";
import {Essentials} from "@ckeditor/ckeditor5-essentials";
import {FontBackgroundColor, FontColor} from "@ckeditor/ckeditor5-font";
import {Heading} from "@ckeditor/ckeditor5-heading";
import {HorizontalLine} from "@ckeditor/ckeditor5-horizontal-line";
import {Image, ImageCaption, ImageResize, ImageStyle, ImageToolbar} from "@ckeditor/ckeditor5-image";
import {Link} from "@ckeditor/ckeditor5-link";
import {List, TodoList} from "@ckeditor/ckeditor5-list";
import {Paragraph} from "@ckeditor/ckeditor5-paragraph";
import {PasteFromOffice} from "@ckeditor/ckeditor5-paste-from-office";
import {RemoveFormat} from "@ckeditor/ckeditor5-remove-format";
import {Table, TableCellProperties, TableProperties, TableToolbar} from "@ckeditor/ckeditor5-table";
import {TextTransformation} from "@ckeditor/ckeditor5-typing";
import {Timestamp} from "./timestamp.js";

/**
 * The CKEditor configuration options.
 * @typedef {Object.<string, *>} EditorConfig
 */

/**
 * An implementation of a rich text editor.
 */
export class RichTextEditor extends ClassicEditor {

	/**
	 * The set of supported plug-ins.
	 * @type {Array.<module:"@ckeditor/ckeditor5-core".Plugin.constructor>}
	 * @readonly
	 */
	static builtinPlugins = [
		Alignment,
		Autoformat,
		Bold, Italic, Strikethrough, Underline,
		Essentials,
		FontBackgroundColor, FontColor,
		Heading,
		HorizontalLine,
		Image, ImageCaption, ImageResize, ImageStyle, ImageToolbar,
		Link,
		List, TodoList,
		Paragraph,
		PasteFromOffice,
		RemoveFormat,
		Table, TableCellProperties, TableProperties, TableToolbar,
		TextTransformation,
		Timestamp
	];

	/**
	 * The default editor settings.
	 * @type {EditorConfig}
	 * @readonly
	 */
	static defaultConfig = {
		alignment: {
			options: ["left", "center", "right"]
		},
		image: {
			resizeUnit: "px",
			styles: ["alignLeft", "alignCenter", "alignRight"],
			toolbar: ["imageStyle:alignLeft", "imageStyle:alignCenter", "imageStyle:alignRight"]
		},
		language: "fr",
		table: {
			contentToolbar: ["tableColumn", "tableRow", "mergeTableCells", "tableProperties", "tableCellProperties"]
		},
		toolbar: [
			"heading", "|",
			"bold", "italic", "underline", "strikethrough", "link", "|",
			"fontColor", "fontBackgroundColor", "|",
			"removeFormat", "|",
			"undo", "redo", "|",
			"bulletedList", "numberedList", "todoList", "|",
			"alignment:left", "alignment:center", "alignment:right", "|",
			"horizontalLine", "timestamp", "insertTable"
		],
		typing: {
			transformations: {
				remove: ["quotes"]
			}
		}
	};

	/**
	 * Creates a new rich text editor.
	 * @param {(HTMLElement|string)} sourceElementOrData The element that will be the source for the created editor or the editor's initial data.
	 * @param {EditorConfig} [config] The editor configuration.
	 * @returns {Promise.<RichTextEditor>} The newly created instance.
	 */
	static create(sourceElementOrData, config = {}) {
		if (!config.language) config.language = "fr";
		return super.create(sourceElementOrData, config);
	}
}
