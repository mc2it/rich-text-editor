# Usage
This package supplies a single class, `RichTextEditor`, which is a custom build of the [CKEditor's classic editor](https://ckeditor.com/docs/ckeditor5/latest/examples/builds/classic-editor.html).
It extends from the `ClassicEditor` class provided by this project, so its usage is basically the same.

In your HTML page, add an element that **MC2IT Rich Text Editor** should make editable:

```html
<textarea id="editor"></textarea>
```

Then call the `RichTextEditor.create()` method:

```html
<script>
	RichTextEditor
		.create(document.querySelector("#editor"))
		.catch(console.error);
</script>
```

This code snippet will turn the `<textarea id="editor">` into a rich text editor.

## Localization
By default, the editor will display in **French**. This is the language built into the `mc2it_rte.js` file.

In order to change the language of the editor UI, you need to load additional language file(s).
These files are located in the `lib/i18n` folder of this package.

```html
<!-- jsDelivr -->
<script src="https://cdn.jsdelivr.net/npm/@mc2it/rich-text-editor/lib/i18n/[lang].js"></script>

<!-- MC2IT -->
<script src="https://static.sabcomputer.com/js/rich-text-editor/latest/i18n/[lang].js"></script>

<!-- UNPKG -->
<script src="https://unpkg.com/@mc2it/rich-text-editor/lib/i18n/[lang].js"></script>
```

For example:

```html
<!-- jsDelivr -->
<script src="https://cdn.jsdelivr.net/npm/@mc2it/rich-text-editor/lib/mc2it_rte.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@mc2it/rich-text-editor/lib/i18n/en.js"></script>

<!-- MC2IT -->
<script src="https://static.sabcomputer.com/js/rich-text-editor/latest/mc2it_rte.js"></script>
<script src="https://static.sabcomputer.com/js/rich-text-editor/latest/i18n/en.js"></script>

<!-- UNPKG -->
<script src="https://unpkg.com/@mc2it/rich-text-editor/lib/mc2it_rte.js"></script>
<script src="https://unpkg.com/@mc2it/rich-text-editor/lib/i18n/en.js"></script>
```

Next, you can configure the editor to use one of the loaded language:

```html
<script>
	RichTextEditor
		.create(document.querySelector("#editor"), {language: "en"})
		.catch(console.error);
</script>
```

## Advanced usage
For other uses and detailed instructions, you should look at the [official CKEditor documentation](https://ckeditor.com/docs/ckeditor5/latest).

?> This library provides partial [Haxe extern definitions](https://haxe.org/manual/lf-externs.html)
for the CKEditor packages. These externs are located in the `ckeditor` namespace, and can be used
to create [CKEditor plugins](https://ckeditor.com/docs/ckeditor5/latest/builds/guides/development/plugins.html)
using [Haxe](https://haxe.org).
