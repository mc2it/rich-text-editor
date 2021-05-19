package ckeditor;

import ckeditor.alignment.*;
import ckeditor.autoformat.*;
import ckeditor.basic_styles.*;
import ckeditor.core.*;
import ckeditor.core.editor.*;
import ckeditor.editor_classic.*;
import ckeditor.essentials.*;
import ckeditor.font.*;
import ckeditor.heading.*;
import ckeditor.horizontal_line.*;
import ckeditor.image.*;
import ckeditor.link.*;
import ckeditor.list.*;
import ckeditor.paragraph.*;
import ckeditor.paste_from_office.*;
import ckeditor.remove_format.*;
import ckeditor.table.*;
import ckeditor.timestamp.*;
import ckeditor.typing.*;
import haxe.extern.EitherType;
import js.html.HtmlElement;
import js.lib.Promise;

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
		RemoveFormat,
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

	/** Creates a new rich text editor. **/
	static function create(sourceElementOrData: EitherType<HtmlElement, String>, ?config: EditorConfig): Promise<RichTextEditor> {
		if (config == null) config = {language: "fr"};
		else if (config.language == null) config.language = "fr";
		return Reflect.callMethod(RichTextEditor, ClassicEditor.create, [sourceElementOrData, config]);
	}
}
