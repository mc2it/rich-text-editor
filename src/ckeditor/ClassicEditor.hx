package ckeditor;

@:jsRequire('@ckeditor/ckeditor5-core/src/editor/editor')
extern class Editor {}

@:jsRequire('@ckeditor/ckeditor5-editor-classic/src/classiceditor')
extern class ClassicEditor extends Editor {}
