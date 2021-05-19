package ckeditor.utils;

import ckeditor.utils.EmitterMixin.Emitter;

/** An interface which adds "observable properties" and data binding functionality. **/
extern interface Observable extends Emitter {

	/** Binds observable properties to other objects implementing the `Observable` interface. **/
	function bind(properties: Rest<String>): {
		to: Rest<EitherType<String, EitherType<Observable, Function>>> -> Void,
		toMany: (Array<Observable>, String, Function) -> Void
	};

	/** Creates and sets the value of an observable property. **/
	function set(name: EitherType<String, DynamicAccess<Any>>, ?value: Any): Void;
}
