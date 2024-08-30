package com.sulvic.enos_tn.states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.ui.FlxUIState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
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
		new FlxTimer().start(1, function(timer:FlxTimer):Void{
			startTitle();
		});
	}

	public override function update(elapsed:Float):Void{

		super.update(elapsed);
	}

	private function skipIntro():Void{
		if(!skippedIntro) {
			FlxG.camera.flash(FlxColor.BLACK, 4);
			skippedIntro = true;
		}
	}

	private function startTitle():Void{
		if(!initialized) {
			initialized = true;
		}
		persistentUpdate = true;
		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);
		var logo:FlxSprite = new FlxSprite().loadGraphic("assets/title_logo_xpmt.png");
		logo.setPosition((FlxG.stage.width - logo.width) / 2, 40);
		var playText:FlxText = new FlxText(10, 90, 0, "Play");
		playText.setFormat("Arial", 36, FlxColor.YELLOW);
		var optionsText:FlxText = new FlxText(10, 120, 0, "Options");
		optionsText.setFormat("Arial", 24, FlxColor.WHITE);
		add(optionsText);
		if(initialized) skipIntro();
		else initialized = true;
	}

}
