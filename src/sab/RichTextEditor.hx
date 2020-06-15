package sab;

import js.npm.ckeditor.ClassicEditor;
import js.npm.ckeditor.Plugin;

/** An implementation of a rich text editor. **/
@:expose
@:require(js)
class RichTextEditor extends ClassicEditor {

	/** The set of supported plug-ins. **/
	public static final builtinPlugins: Array<Class<Plugin>> = [
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
		RemoveFormat, RemoveFormatLinks,
		Table, TableCellProperties, TableProperties, TableToolbar,
		TextTransformation
	];

	/** The default editor settings. **/
	public static final defaultConfig = {
		alignment: {
			options: ["left", "center", "right"]
		},
		image: {
			resizeUnit: "px",
			styles: ["full", "alignLeft", "alignCenter", "alignRight"],
			toolbar: ["imageStyle:full", "imageStyle:alignLeft", "imageStyle:alignCenter", "imageStyle:alignRight"]
		},
		language: "fr",
		table: {
			contentToolbar: [
				"tableColumn", "tableRow", "mergeTableCells",
				"tableProperties", "tableCellProperties"
			]
		},
		toolbar: [
			"heading", "|",
			"bold", "italic", "underline", "strikethrough", "link", "|",
			"fontColor", "fontBackgroundColor", "|",
			"removeFormat", "|",
			"undo", "redo", "|",
			"bulletedList", "numberedList", "todoList", "|",
			"alignment:left", "alignment:center", "alignment:right", "|",
			"horizontalLine", "insertTable"
		],
		typing: {
			transformations: {
				remove: ["quotes"]
			}
		}
	};
}
