package ckeditor.ui;

import ckeditor.utils.Locale;

/** A helper class implementing the UI component (view) factory. **/
@:jsRequire("@ckeditor/ckeditor5-ui/src/componentfactory.js", "default")
extern class ComponentFactory {

	/**
		Registers a component factory function that will be used by the `create()` method
		and called with the editor locale as an argument, allowing localization of the view.
	**/
	function add(name: String, callback: Locale -> Dynamic): Void;
}
