package com.sulvic.enos.tn.input;

import flixel.input.FlxInput;
import flixel.input.keyboard.FlxKey;
import flixel.input.actions.FlxAction;
import flixel.input.actions.FlxActionInput;
import flixel.input.actions.FlxActionInputDigital;

/**
 * @author Crimzega
 */
class Binding{

	private var mainAction:FlxActionDigital;

	public function new(name:String){ mainAction = new FlxActionDigital(name); }

	public function getActions():Array<FlxActionDigital>{ return [mainAction]; }

	public function checkMainAction():Bool{ return mainAction.check(); }

	public function getMainAction():FlxActionDigital{ return mainAction; }

	public function bindMainActionKeys(keys:Array<FlxKey>):Void{ for(key in keys) mainAction.addKey(key, FlxInputState.PRESSED); }

	public function replaceMainActionKey(replacing:FlxKey, replacement:FlxKey):Void{
		for(i in 0...mainAction.inputs.length){
			var input:FlxActionInput = mainAction.inputs[i];
			if(input.device == FlxInputDevice.KEYBOARD && input.inputID == replacing){
				@:privateAccess
				mainAction.inputs[i].inputID = replacement;
			}
		}
	}

	public function unbindMainActionKeys(keys:Array<FlxKey>):Void{
		for(i in mainAction.inputs.length...0){
			var input:FlxActionInput = mainAction.inputs[i];
			if(input.device == FlxInputDevice.KEYBOARD && keys.indexOf(input.inputID) != -1) mainAction.remove(input);
		}
	}

}
