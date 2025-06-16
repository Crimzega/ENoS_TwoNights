package com.sulvic.input;

import flixel.input.FlxInput;
import flixel.input.actions.FlxAction;

interface Bind<BindType>{

	function bind(keys:Array<BindType>):Void;

	function replace(replacing:BindType, replacement:BindType);

	function unbind(keys:Array<BindType>);

}
