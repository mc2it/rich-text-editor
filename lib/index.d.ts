import Plugin from "@ckeditor/ckeditor5-core/src/plugin.js";
import ClassicEditor from "@ckeditor/ckeditor5-editor-classic/src/classiceditor.js";

/** An implementation of a rich text editor. */
export declare class RichTextEditor extends ClassicEditor {

	/** The set of supported plug-ins. */
	static readonly builtinPlugins: Array<typeof Plugin>;

	/** The default editor settings. */
	static readonly defaultConfig: Record<string, any>;
}
