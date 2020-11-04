package mc2it_rte;

import js.lib.Promise;
import js.npm.ckeditor.alignment.*;
import js.npm.ckeditor.autoformat.*;
import js.npm.ckeditor.basic_styles.*;
import js.npm.ckeditor.core.*;
import js.npm.ckeditor.core.editor.*;
import js.npm.ckeditor.editor_classic.*;
import js.npm.ckeditor.essentials.*;
import js.npm.ckeditor.font.*;
import js.npm.ckeditor.heading.*;
import js.npm.ckeditor.horizontal_line.*;
import js.npm.ckeditor.image.*;
import js.npm.ckeditor.link.*;
import js.npm.ckeditor.list.*;
import js.npm.ckeditor.paragraph.*;
import js.npm.ckeditor.paste_from_office.*;
import js.npm.ckeditor.remove_format.*;
import js.npm.ckeditor.table.*;
import js.npm.ckeditor.typing.*;
import mc2it_rte.timestamp.Timestamp;

/** An implementation of a rich text editor. **/
@:expose class RichTextEditor extends ClassicEditor {

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
		TextTransformation,
		Timestamp
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

	/** Creates a new rich text editor. **/
	static function create(sourceElementOrData, ?config: EditorConfig): Promise<RichTextEditor>
		return Reflect.callMethod(RichTextEditor, ClassicEditor.create, [sourceElementOrData, config]);
}
