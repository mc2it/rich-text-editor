# Installation

## Installing from a content delivery network
**MC2IT Rich Text Editor** is hosted on several content delivery networks (CDN).
To install it, add one of these code snippets to the `<head>` of your HTML document:

```html
<!-- jsDelivr -->
<script src="https://cdn.jsdelivr.net/npm/@mc2it/rich-text-editor/build/editor.js"></script>

<!-- MC2IT -->
<script src="https://static.sabcomputer.com/js/rich-text-editor/latest/editor.js"></script>

<!-- UNPKG -->
<script src="https://unpkg.com/@mc2it/rich-text-editor/build/editor.js"></script>
```

## Installing with a package manager
Before installing **MC2IT Rich Text Editor** with a package manager, you need to make sure you have either [Haxe](https://haxe.org) or [Node.js](https://nodejs.org) up and running.

You can verify if you're already good to go with the following commands:

<!-- tabs:start -->

#### **Haxe**
```shell
haxe --version
# 4.2.0

haxelib version
# 4.0.2
```

#### **JavaScript**
```shell
node --version
# v15.8.0

npm --version
# 7.5.1
```

<!-- tabs:end -->

Now, you can continue with the procedure:

<!-- tabs:start -->

#### **Haxe**
From a command prompt, run:

```shell
haxelib install mc2it_rte
```

Then, add this code snippet to the `<head>` of your HTML document:

```html
<script src=".haxelib/mc2it_rte/[version]/build/editor.js"></script>
```

?> Replace `[version]` with the current version number of the package (using commas instead of dots: `1,0,1` in place of `1.0.1`).

#### **JavaScript**
From a command prompt, run:

```shell
npm install @mc2it/rich-text-editor
```

Then, add this code snippet to the `<head>` of your HTML document:

```html
<script src="node_modules/@mc2it/rich-text-editor/build/editor.js"></script>
```

<!-- tabs:end -->
