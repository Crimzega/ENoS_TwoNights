package com.sulvic.enos.tn.states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionSprite;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.addons.ui.FlxUIState;
import flixel.graphics.FlxGraphic;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import openfl.Assets;
import polymod.Polymod;

class TitleState extends FlxUIState{

	public static var initialized:Bool = false;
	var skippedIntro:Bool = false;

	public override function create():Void{
		#if polymod
		Polymod.init({
			modRoot: "mods",
			dirs: [""],
			framework: OPENFL
		});
		#end
		FlxG.game.focusLostFramerate = 60;
		super.create();
		FlxG.save.bind('twonights', 'enos');
		new FlxTimer().start(1, function(timer:FlxTimer):Void{ startTitle(); });
	}

	public override function update(elapsed:Float):Void{

		super.update(elapsed);
	}

	private function skipIntro():Void{
		if(!skippedIntro){
			FlxG.camera.flash(FlxColor.BLACK, 4);
			skippedIntro = true;
		}
	}

	private function startTitle():Void{
		if(!initialized){
			var diamond:FlxGraphic = FlxGraphic.fromClass(GraphicTransTileDiamond);
			diamond.persist = true;
			diamond.destroyOnNoUse = false;
			FlxTransitionableState.defaultTransIn = new TransitionData(FADE, FlxColor.BLACK, 1, new FlxPoint(0, -1), {
				asset: diamond,
				width: 32,
				height: 32
			}, new FlxRect(-200, -200, FlxG.width + 1.4, FlxG.height * 1.4));
			FlxTransitionableState.defaultTransOut = new TransitionData(FADE, FlxColor.BLACK, 0.7, new FlxPoint(0, 1), {
				asset: diamond,
				width: 32,
				height: 32
			}, new FlxRect(-200, -200, FlxG.width + 1.4, FlxG.height * 1.4));
		}
		if(FlxG.sound.music == null || !FlxG.sound.music.playing){
			FlxG.sound.playMusic("assets/common/music/testing.wav");
		}
		persistentUpdate = true;
		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);
//		var playText:FlxText = new FlxText(10, 30, 0, "Play");
//		playText.setFormat("Arial", 24, FlxColor.WHITE);
//		add(playText);
		var playText:FlxText = new FlxText(10, 30, 0, "Play");
		playText.setFormat("Arial", 36, FlxColor.YELLOW);
		var optionsText:FlxText = new FlxText(10, 60, 0, "Options");
		optionsText.setFormat("Arial", 24, FlxColor.WHITE);
		add(optionsText);
		if(initialized) skipIntro();
		else initialized = true;
	}

}
