package ckeditor.ui.button;

/** The button view class. **/
@:jsRequire("@ckeditor/ckeditor5-ui/src/button/buttonview.js", "default")
extern class ButtonView extends View implements Button {

	/** An XML content of the icon. **/
	var icon: String;

	/** Controls whether the button view is enabled, i.e. it can be clicked and execute an action. **/
	var isEnabled: Bool;

	/** Controls whether the button view is visible. **/
	var isVisible: Bool;

	/** The label of the button view visible to the user when `withText` is `true`. **/
	var label: String;

	/** The tooltip of the button, i.e. displayed when hovering the button with the mouse cursor.**/
	var tooltip: EitherType<Bool, EitherType<String, (String, String) -> String>>;

	/** The HTML type of the button. **/
	var type: String;

	/** Controls whether the label of the button is hidden (e.g. an icon–only button). **/
	var withText: Bool;
}
