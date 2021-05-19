package ckeditor.ui.icon;

/** The icon view class. **/
@:jsRequire("@ckeditor/ckeditor5-ui/src/icon/iconview.js", "default")
extern class IconView extends View {

	/** The SVG source of the icon. **/
	var content: String;

	/** The fill color of the child `path.ck-icon__fill`. **/
	var fillColor: String;

	/** Specifies the boundaries to which the icon content should stretch. **/
	var viewBox: String;
}
