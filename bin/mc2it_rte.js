#!/usr/bin/env node
import process from "node:process";
import {main} from "../lib/cli.js";

// Start the application.
try { await main(); }
catch (error) {
	console.error(error);
	process.exitCode = 1;
}
