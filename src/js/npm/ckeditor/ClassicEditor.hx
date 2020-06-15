package js.npm.ckeditor;

@:jsRequire("@ckeditor/ckeditor5-core/src/editor/editor.js", "default")
extern class Editor {}

@:jsRequire("@ckeditor/ckeditor5-editor-classic/src/classiceditor.js", "default")
extern class ClassicEditor extends Editor {}
