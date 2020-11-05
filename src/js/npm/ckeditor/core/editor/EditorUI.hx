package js.npm.ckeditor.core.editor;

import js.npm.ckeditor.ui.ComponentFactory;

/** A class providing the minimal interface that is required to successfully bootstrap any editor UI. **/
@:jsRequire("@ckeditor/ckeditor5-core/src/editor/editorui.js", "default")
extern class EditorUI {

	/** Aregistry used by plugins to register factories of specific UI components. **/
	final componentFactory: ComponentFactory;
}
