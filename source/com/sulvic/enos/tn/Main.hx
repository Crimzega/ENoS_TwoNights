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
class Main extends Sprite{

	var skipSplash:Bool = false;
	var startFullscreen:Bool = false;
	var initialState:Class<FlxState> = TitleState;
	var zoom:Float = -1;
	var gameHeight:Int = 720;
	var gameWidth:Int = 1280;
	var framerate:Int = 120;

	public function new(){
		super();
		if(stage != null) init();
		else addEventListener(Event.ADDED_TO_STAGE, init);
		
	}

	public static function main():Void{ Lib.current.addChild(new Main()); }

	private function init(?evt:Event):Void{
		#if sys
		Sys.environment().set("GJGID", ApiHelper.gameJoltGID);
		Sys.environment().set("GJKEY", ApiHelper.gameJoltKey);
		#end
		if(hasEventListener(Event.ADDED_TO_STAGE)) removeEventListener(Event.ADDED_TO_STAGE, init);
		var stageWidth:Int = Lib.current.stage.stageWidth;
		var stageHeight:Int = Lib.current.stage.stageHeight;
		if(zoom == -1){
			var ratioX:Float = stageWidth / gameWidth;
			var ratioY:Float = stageHeight / gameHeight;
			zoom = Math.min(ratioX, ratioY);
			gameWidth = Math.ceil(stageWidth / zoom);
			gameHeight = Math.ceil(stageHeight / zoom);
		}
		#if !debug
		initialState = TitleState;
		#end
		addChild(new FlxGame(gameWidth, gameHeight, initialState, framerate, framerate, skipSplash, startFullscreen));
		#if debug
		addChild(new FPS(10, 8, 0xFFFFFF));
		#end
	}

}
