package com.sulvic.enos.tn;

import com.sulvic.enos.tn.api.ApiHelper;
import com.sulvic.enos.tn.states.TitleState;
import flixel.FlxGame;
import flixel.FlxState;
import openfl.Lib;
import openfl.display.FPS;
import openfl.display.Sprite;
import openfl.events.Event;

/* Etrulnix Noqalev ojikrev Sinucrox */
class TwoNightsEngine extends Sprite{

	public function new(){
		super();
		if(stage != null) init();
		else addEventListener(Event.ADDED_TO_STAGE, init);
	}

	public static function main():Void{
		Lib.current.addChild(new Main());
	}

	private function init(?evt:Event):Void{}

}
