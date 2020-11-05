import Plugin from "@ckeditor/ckeditor5-core/src/plugin.js";
import ClassicEditor from "@ckeditor/ckeditor5-editor-classic/src/classiceditor.js";

export interface EditorConfig {
	extraPlugins: Array<typeof Plugin>;
	initialData: string;
	language: string | {content: string, ui: string};
	placeholder: string;
	plugins: Array<string | typeof Plugin>;
	removePlugins: string[];
	toolbar: string[] | {items: string[], shouldNotGroupWhenFull?: boolean, viewportTopOffset?: number};
}

export declare class RichTextEditor extends ClassicEditor {
	static readonly builtinPlugins: Array<typeof Plugin>;
	static readonly defaultConfig: Record<string, any>;
	static create(sourceElementOrData: string | HTMLElement, config?: Partial<EditorConfig>): Promise<RichTextEditor>;
}
