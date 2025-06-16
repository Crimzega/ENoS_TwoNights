package com.sulvic.input;

import flixel.input.gamepad.FlxGamepad;

class StoredGamepads{

	private static var storedGamepads:Array<FlxGamepad> = [];

	private static function getGamepad(id:Int):FlxGamepad{
		for(gamepad in GAMEPADS)
			if(gamepad.id == id) return gamepad;
		var result:FlxGamepad = new FlxGamepad(id);
		GAMEPADS.push(result);
		return result;
	}

}
