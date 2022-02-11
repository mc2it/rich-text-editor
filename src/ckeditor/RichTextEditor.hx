package ckeditor;

import ckeditor.alignment.Alignment;
import ckeditor.autoformat.Autoformat;
import ckeditor.basic_styles.Bold;
import ckeditor.basic_styles.Italic;
import ckeditor.basic_styles.Strikethrough;
import ckeditor.basic_styles.Underline;
import ckeditor.core.Plugin;
import ckeditor.core.editor.EditorConfig;
import ckeditor.editor_classic.ClassicEditor;
import ckeditor.essentials.Essentials;
import ckeditor.font.FontBackgroundColor;
import ckeditor.font.FontColor;
import ckeditor.heading.Heading;
import ckeditor.horizontal_line.HorizontalLine;
import ckeditor.image.Image;
import ckeditor.image.ImageCaption;
import ckeditor.image.ImageResize;
import ckeditor.image.ImageStyle;
import ckeditor.image.ImageToolbar;
import ckeditor.link.Link;
import ckeditor.list.List;
import ckeditor.list.TodoList;
import ckeditor.paragraph.Paragraph;
import ckeditor.paste_from_office.PasteFromOffice;
import ckeditor.remove_format.RemoveFormat;
import ckeditor.table.Table;
import ckeditor.table.TableCellProperties;
import ckeditor.table.TableProperties;
import ckeditor.table.TableToolbar;
import ckeditor.timestamp.Timestamp;
import ckeditor.typing.TextTransformation;
import js.html.Element;
import js.lib.Promise;

/** An implementation of a rich text editor. **/
@:expose
@:noDoc
class RichTextEditor extends ClassicEditor {

	/** The set of supported plug-ins. **/
	static final builtinPlugins: Array<Class<Plugin>> = [
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
	static final defaultConfig = {
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

	/** Creates a new rich text editor. **/
	public static function create(sourceElementOrData: EitherType<Element, String>, ?config: EditorConfig): Promise<RichTextEditor> {
		if (config == null) config = {language: "fr"};
		if (config.language == null) config.language = "fr";
		return Reflect.callMethod(RichTextEditor, ClassicEditor.create, [sourceElementOrData, config]);
	}
}
