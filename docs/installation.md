# Installation

## Installing from a content delivery network
**MC2IT Rich Text Editor** is hosted on several content delivery networks (CDN).
To install it, add one of these code snippets to the `<head>` of your HTML document:

```html
<script src="https://static.sabcomputer.com/js/rich-text-editor/latest/mc2it_rte.js"></script>
```

## Installing with a package manager
Before installing **MC2IT Rich Text Editor** with a package manager, you need to make sure you have either [Haxe](https://haxe.org) or [Node.js](https://nodejs.org) up and running.

You can verify if you're already good to go with the following commands:

```shell
haxe --version
# 4.2.2

haxelib version
# 4.0.2
```

Now, you can continue with the procedure:

<!-- tabs:start -->

#### **Haxe**
From a command prompt, run:

```shell
haxelib install mc2it_rte
```

Then, add this code snippet to the `<head>` of your HTML document:

```html
<script src=".haxelib/mc2it_rte/[version]/lib/mc2it_rte.js"></script>
```

?> Replace `[version]` with the current version number of the package (using commas instead of dots: `1,0,1` in place of `1.0.1`).

#### **JavaScript**
From a command prompt, run:

```shell
npm install @mc2it/rich-text-editor
```

Then, add this code snippet to the `<head>` of your HTML document:

```html
<script src="node_modules/@mc2it/rich-text-editor/lib/mc2it_rte.js"></script>
```

<!-- tabs:end -->
