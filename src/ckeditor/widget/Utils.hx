package ckeditor.widget;

import ckeditor.engine.model.Model;
import ckeditor.engine.view.DowncastWriter;
import ckeditor.engine.view.Element;
import ckeditor.engine.view.Node;

/** A set of helper functions for widgets. **/
@:jsRequire("@ckeditor/ckeditor5-widget/src/utils.js")
extern class Utils {

	/** Returns a value indicating whether the given `node` is an element and a widget. **/
	static function isWidget(node: Node): Bool;

	/** Converts the given `element` to a widget. **/
	static function toWidget(element: Element, writer: DowncastWriter, ?options: {?hasSelectionHandle: Bool, ?label: EitherType<String, () -> String>}): Element;

	/** Maps view positions to correct model positions when implementing a widget which renders non-empty view element for an empty model element. **/
	static function viewToModelPositionOutsideModelElement(model: Model, viewElementMatcher: Element -> Bool): (String, Dynamic) -> Void;
}
