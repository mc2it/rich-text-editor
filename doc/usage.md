---
path: blob/master
source: src/sab/RichTextEditor.hx
---

# Usage
This package supplies a single class, `RichTextEditor`, which is a custom build of the [CKEditor's classic editor](https://ckeditor.com/docs/ckeditor5/latest/examples/builds/classic-editor.html).
It extends from the [`ClassicEditor` class](https://ckeditor.com/docs/ckeditor5/latest/api/module_editor-classic_classiceditor-ClassicEditor.html) provided by that project, so its usage is basically the same.

In your HTML page, add an element that **SAB Rich Text Editor** should make editable:

``` html
<textarea id="editor"></textarea>
```

Then call the `RichTextEditor.create()` method:

``` html
<script>
	RichTextEditor
		.create(document.querySelector("#editor"))
		.catch(console.error);
</script>
```

This code snippet will turn the `<textarea id="editor">` into a rich text editor.

## Localization
By default, the editor will display in **French**. This is the language built into the `editor.js` file.

In order to change the language of the editor UI, you need to load additional language file(s).
These files are located in the `build/i18n` folder of this package.

``` html
<!-- jsDelivr -->
<script src="https://cdn.jsdelivr.net/npm/@sab-international/rich-text-editor/build/i18n/[lang].js"></script>

<!-- UNPKG -->
<script src="https://unpkg.com/@sab-international/rich-text-editor/build/i18n/[lang].js"></script>

<!-- SAB International -->
<script src="https://static.sabcomputer.com/js/rich-text-editor/latest/i18n/[lang].js"></script>
```

For example:

``` html
<!-- jsDelivr -->
<script src="https://cdn.jsdelivr.net/npm/@sab-international/rich-text-editor/build/editor.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@sab-international/rich-text-editor/build/i18n/en.js"></script>

<!-- UNPKG -->
<script src="https://unpkg.com/@sab-international/rich-text-editor/build/editor.js"></script>
<script src="https://unpkg.com/@sab-international/rich-text-editor/build/i18n/en.js"></script>

<!-- SAB International -->
<script src="https://static.sabcomputer.com/js/rich-text-editor/latest/editor.js"></script>
<script src="https://static.sabcomputer.com/js/rich-text-editor/latest/i18n/en.js"></script>
```

Next, you can configure the editor to use one of the loaded language:

``` html
<script>
	RichTextEditor
		.create(document.querySelector("#editor"), {language: "en"})
		.catch(console.error);
</script>
```

## Advanced usage
For other uses and detailed instructions, you should look at the [official CKEditor documentation](https://ckeditor.com/docs/ckeditor5/latest).
