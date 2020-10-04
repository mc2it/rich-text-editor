# Installation

## Installing from a content delivery network
**SAB Rich Text Editor** is hosted on several content delivery networks (CDN).
To install it, add one of these code snippets to the `<head>` of your HTML document:

``` html
<!-- jsDelivr -->
<script src="https://cdn.jsdelivr.net/npm/@sab-international/rich-text-editor/build/editor.js"></script>

<!-- UNPKG -->
<script src="https://unpkg.com/@sab-international/rich-text-editor/build/editor.js"></script>

<!-- SAB International -->
<script src="https://static.sabcomputer.com/js/rich-text-editor/latest/editor.js"></script>
```

## Installing with npm package manager
Before installing **SAB Rich Text Editor**, you need to make sure you have [Node.js](https://nodejs.org)
and [npm](https://www.npmjs.com), the Node.js package manager, up and running.

You can verify if you're already good to go with the following commands:

``` shell
node --version
# v14.13.0

npm --version
# 6.14.8
```

### 1. Install it
From a command prompt, run:

``` shell
npm install @sab-international/rich-text-editor
```

### 2. Import it
Add this code snippet to the `<head>` of your HTML document:

``` html
<script src="node_modules/@sab-international/rich-text-editor/build/editor.js"></script>
```

You can also create your own bundle by importing the `RichTextEditor` class into
your [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) code:

``` js
// CommonJS module.
const {RichTextEditor} = require("@sab-international/rich-text-editor");

// ECMAScript module.
import {RichTextEditor} from "@sab-international/rich-text-editor";
```

!!! tip
	To build the bundle, you will need to use the [`webpack` module bundler](https://webpack.js.org).  
	See the [`etc/webpack.js` configuration file](https://github.com/sab-international/rich-text-editor/blob/main/etc/webpack.js) located in this package as a starting point.
