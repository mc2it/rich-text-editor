package js.npm.ckeditor.widget;

import haxe.extern.EitherType;
import js.npm.ckeditor.core.Plugin;
import js.npm.ckeditor.engine.DowncastWriter;
import js.npm.ckeditor.engine.Element;
import js.npm.ckeditor.engine.Node;

/** A set of helper functions. **/
@:jsRequire("@ckeditor/ckeditor5-widget/src/utils.js")
extern class Utils {

	/** Returns a value indicating whether the given `node` is an element and a widget. **/
	static function isWidget(node: Node): Bool;

	/** Converts the given `element` to a widget. **/
	static function toWidget(element: Element, writer: DowncastWriter, ?options: {?hasSelectionHandle: Bool, ?label: EitherType<String, () -> String>}): Element;
}

/** The widget plugin. **/
@:jsRequire("@ckeditor/ckeditor5-widget/src/widget.js", "default")
extern class Widget extends Plugin {}
