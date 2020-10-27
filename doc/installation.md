# Installation

## Installing from a content delivery network
**MC2IT Rich Text Editor** is hosted on several content delivery networks (CDN).
To install it, add one of these code snippets to the `<head>` of your HTML document:

``` html
<!-- jsDelivr -->
<script src="https://cdn.jsdelivr.net/npm/@mc2it/rich-text-editor/build/editor.js"></script>

<!-- UNPKG -->
<script src="https://unpkg.com/@mc2it/rich-text-editor/build/editor.js"></script>

<!-- MC2IT -->
<script src="https://static.sabcomputer.com/js/rich-text-editor/latest/editor.js"></script>
```

## Installing with npm package manager
Before installing **MC2IT Rich Text Editor**, you need to make sure you have [Node.js](https://nodejs.org)
and [npm](https://www.npmjs.com), the Node.js package manager, up and running.

You can verify if you're already good to go with the following commands:

``` shell
node --version
# v15.0.1

npm --version
# 7.0.3
```

### 1. Install it
From a command prompt, run:

``` shell
npm install @mc2it/rich-text-editor
```

### 2. Import it
Add this code snippet to the `<head>` of your HTML document:

``` html
<script src="node_modules/@mc2it/rich-text-editor/build/editor.js"></script>
```

You can also create your own bundle by importing the `RichTextEditor` class into
your [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) code:

``` js
// CommonJS module.
const {RichTextEditor} = require("@mc2it/rich-text-editor");

// ECMAScript module.
import {RichTextEditor} from "@mc2it/rich-text-editor";
```

!!! tip
	To build the bundle, you will need to use the [`webpack` module bundler](https://webpack.js.org).  
	See the [`etc/webpack.js` configuration file](https://github.com/mc2it/rich-text-editor/blob/main/etc/webpack.js) located in this package as a starting point.
