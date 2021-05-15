package js.ckeditor.engine.view;

/** A view element. **/
@:jsRequire("@ckeditor/ckeditor5-engine/src/view/element.js", "default")
extern class Element extends Node {

	/** Gets the child at the given index. **/
	function getChild(index: Int): Node;

	/** Gets an attribute value for the given `key`. **/
	function getAttribute(key: String): Dynamic;

	/** Returns a value indicating whether one or several classes are present. **/
	function hasClass(className: Rest<String>): Bool;

	/** Checks if this element has an attribute with the given `key`. **/
	function hasAttribute(key: String): Bool;
}
