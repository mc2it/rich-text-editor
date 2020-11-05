package js.npm.ckeditor.engine.view;

/** A view upcast writer. **/
@:jsRequire("@ckeditor/ckeditor5-engine/src/view/upcastwriter.js", "default")
extern class UpcastWriter {

	/** Creates a new `Element` instance. **/
	function createElement(name: String, ?attributes: DynamicAccess<String>, ?children: EitherType<Node, Array<Node>>): Element;
}
