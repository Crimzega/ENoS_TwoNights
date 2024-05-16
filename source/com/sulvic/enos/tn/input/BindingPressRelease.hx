package com.sulvic.enos.tn.input;

import flixel.input.FlxInput;
import flixel.input.keyboard.FlxKey;
import flixel.input.actions.FlxAction;
import flixel.input.actions.FlxActionInput;
import flixel.input.actions.FlxActionInputDigital;

/**
 * @author Crimzega
 */
class BindingPressRelease extends Binding{

    private var pressedAction:FlxActionDigital;
    private var releasedAction:FlxActionDigital;

    public function new(name:String){
        super(name);
        pressedAction = new FlxActionDigital('${name}Pressed');
        releasedAction = new FlxActionDigital('${name}Released');
    }

    public override function getActions():Array<FlxActionDigital>{ return [getMainAction(), pressedAction, releasedAction]; }

	public function checkPressedAction():Bool{ return pressedAction.check(); }

	public function checkReleasedAction():Bool{ return releasedAction.check(); }

    public function getPressedAction():FlxActionDigital{ return pressedAction; }

    public function getReleasedAction():FlxActionDigital{ return releasedAction; }

	public function bindPressedActionKeys(keys:Array<FlxKey>):Void{ for(key in keys) pressedAction.addKey(key, FlxInputState.JUST_PRESSED); }

	public function bindReleasedActionKeys(keys:Array<FlxKey>):Void{ for(key in keys) releasedAction.addKey(key, FlxInputState.JUST_RELEASED); }

	public function replacePressedActionKey(replacing:FlxKey, replacement:FlxKey):Void{
		for(i in 0...pressedAction.inputs.length){
			var input:FlxActionInput = pressedAction.inputs[i];
			if(input.device == FlxInputDevice.KEYBOARD && input.inputID == replacing){
				@:privateAccess
				pressedAction.inputs[i].inputID = replacement;
			}
		}
	}

	public function replaceReleasedActionKey(replacing:FlxKey, replacement:FlxKey):Void{
		for(i in 0...releasedAction.inputs.length){
			var input:FlxActionInput = releasedAction.inputs[i];
			if(input.device == FlxInputDevice.KEYBOARD && input.inputID == replacing){
				@:privateAccess
				releasedAction.inputs[i].inputID = replacement;
			}
		}
	}

	public function unbindPressedActionKeys(keys:Array<FlxKey>):Void{
		for(i in pressedAction.inputs.length...0){
			var input:FlxActionInput = pressedAction.inputs[i];
			if(input.device == FlxInputDevice.KEYBOARD && keys.indexOf(input.inputID) != -1) pressedAction.remove(input);
		}
	}

	public function unbindReleasedActionKeys(keys:Array<FlxKey>):Void{
		for(i in releasedAction.inputs.length...0){
			var input:FlxActionInput = releasedAction.inputs[i];
			if(input.device == FlxInputDevice.KEYBOARD && keys.indexOf(input.inputID) != -1) releasedAction.remove(input);
		}
	}

}
