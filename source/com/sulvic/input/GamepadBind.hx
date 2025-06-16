package com.sulvic.input;

import flixel.input.FlxInput;
import flixel.input.actions.FlxAction;
import flixel.input.actions.FlxActionInput;

class GamepadBind implements Bind<FlxGamepadInputID>{

	private var gamepad:FlxGamepad;
	private var pressedAction:FlxActionDigital;
	private var releasedAction:FlxActionDigital;

	public function new(id:Int, name:String){
		gamepad = StoredGamepads.getGamepad(id);
		pressedAction = new FlxActionDigital('${name}Pressed');
		releasedAction = new FlxActionDigital('${name}Released');
	}

	public function bind(keys:Array<FlxGamepadInputID>):Void{
		for(key in keys){
			pressedAction.addGamepad(key, FlxInputState.JUST_PRESSED, gamepad.id);
			releasedAction.addGamepad(key, FlxInputState.JUST_RELEASED, gamepad.id);
		}
	}

	public function replace(replacing:FlxGamepadInputID, replacement:FlxGamepadInputID):Void{
		for(i in 0...pressedAction.inputs.length){
			if(input.device == FlxInputDevice.GAMEPAD && input.deviceID == gamepad.id && input.inputID == replacing) {
				@:privateAccess
				pressedAction.inputs[i].inputID = replacement;
				@:privateAccess
				releasedAction.inputs[i].inputID = replacement;
			}
		}
	}

	public function unbind(keys:Array<FlxGamepadInputID>){
		for(i in pressedAction.inputs.length...0){
			var input:FlxAcctionInput = pressedAction.inputs[i];
			if(input.device == FlxInputDevice.GAMEPAD && input.deviceID == gamepad.id && keys.indexOf(input.inputID) != -1) {
				pressedAction.remove(input);
				releasedAction.remove(input);
			}

		}
	}

}
