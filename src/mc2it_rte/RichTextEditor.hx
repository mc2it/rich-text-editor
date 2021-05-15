package mc2it_rte;

import haxe.extern.EitherType;
import js.html.HtmlElement;
import js.lib.Promise;
import js.ckeditor.alignment.*;
import js.ckeditor.autoformat.*;
import js.ckeditor.basic_styles.*;
import js.ckeditor.core.*;
import js.ckeditor.core.editor.*;
import js.ckeditor.editor_classic.*;
import js.ckeditor.essentials.*;
import js.ckeditor.font.*;
import js.ckeditor.heading.*;
import js.ckeditor.horizontal_line.*;
import js.ckeditor.image.*;
import js.ckeditor.link.*;
import js.ckeditor.list.*;
import js.ckeditor.paragraph.*;
import js.ckeditor.paste_from_office.*;
import js.ckeditor.remove_format.*;
import js.ckeditor.table.*;
import js.ckeditor.typing.*;
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
