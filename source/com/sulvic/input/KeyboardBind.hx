package com.sulvic.input;

import flixel.input.FlxInput;
import flixel.input.actions.FlxAction;
import flixel.input.actions.FlxActionInput;
import flixel.input.keyboard.FlxKey;

class KeyboardBind implements Bind<FlxKey>{

	private mainAction:FlxInputDigital;
	private pressedAction:FlxInputDigital;
	private releasedAction:FlxInputDigital;
	public function new(name){
		mainAction = new FlxActionDigital(name);
		pressedAction = new FlxActionDigital('${name}Pressed');
		releasedAction = new FlxActionDigital('${name}Released');
	}

	public function checkMainAction():Bool{
		return mainAction.check();
	}

	public function checkPressedAction():Bool{
		return pressedAction.check();
	}

	public function checkReleasedAction():Bool{
		return releasedAction.check();
	}

	public function getMainAction():FlxInput{
		return mainAction;
	}

	public function getPressedAction():FlxInput{
		return pressedAction;
	}

	public function getReleasedAction():FlxInput{
		return releasedAction;
	}

	public function bind(keys:Array<FlxKey>):Void{
		for(key in keys){
			mainAction.addKey(key, FlxInputState.PRESSED);
			pressedAction.addKey(keys, FlxInputState.JUST_PRESSED);
			releasedAction.addKey(keys, FlxInputState.JUST_RELEASED);
		}
	}

	public function replace(replacing:FlxKey, replacement:FlxKey){
		for(i in 0...mainAction.inputs.length){
			var input:FlxActionInput = mainAction.inputs[i];
			if(input.device == FlxInputDevice.KEYBOARD && input.inputID == replacing) {
				@:privateAccess
				mainAction.inputs[i].inputID = replacement;
				@:privateAccess
				pressedAction.inputs[i].inputID = replacement;
				@:privateAccess
				releasedAction.inputs[i].inputID = replacement;
			}
		}
	}

	public function unbind(keys:Array<FlxKey>):Void{
		for(i in mainAction.inputs.length...0){
			var input:FlxActionInput = mainAction.inputs[i];
			if(input.device == FlxInputDevice.KEYBOARD && keys.indexOf(input.inputID) != -1) {
				mainAction.remove(input);
				pressedAction.remove(input);
				releasedAction.remove(input);
			}
		}
	}

}
