package js.npm.ckeditor.engine.view;

/** The editor's view controller class. **/
@:jsRequire("@ckeditor/ckeditor5-engine/src/view/view.js", "default")
extern class View {

	/** Focuses the DOM element representing `EditableElement` that is currently having selection inside. **/
	function focus(): Void;
}
