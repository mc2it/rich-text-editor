package js.ckeditor.core.editor;

import js.ckeditor.ui.ComponentFactory;
import js.html.HtmlElement;

/** A class providing the minimal interface that is required to successfully bootstrap any editor UI. **/
@:jsRequire("@ckeditor/ckeditor5-core/src/editor/editorui.js", "default")
extern class EditorUI {

	/** Aregistry used by plugins to register factories of specific UI components. **/
	final componentFactory: ComponentFactory;

	/** The main (outermost) DOM element of the editor UI. **/
	final element: Null<HtmlElement>;
}
