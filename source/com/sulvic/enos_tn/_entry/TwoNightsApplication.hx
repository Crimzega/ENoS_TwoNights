package com.sulvic.enos_tn._entry;

import lime.app.Application;
import lime.system.System;
import lime.ui.WindowAttributes;
import openfl.display.Application as OpenFLApplication;

@:access(lime.app.Application)
@:access(lime.system.System)
class TwoNightsApplication{

	#if !macro
	public static function main():Void{
		System.__registerEntryPoint("TwoNights", create);
		#if (js && html5)
		System.embed("TwoNights", null, 1920, 1080);
		#else
		create();
		#end
	}

	public static function create(cfg:Dynamic):Void{
		var app:OpenFLApplication = new OpenFLApplication();
		#if !disable_preloader_assets TwoNightsManifest.init(cfg); #end
		app.meta["build"] = "1";
		app.meta["company"] = "SulvicSystems";
		app.meta["file"] = "ENoS-TwoNights";
		app.meta["packageName"] = "com.sulvic.enos_tn";
		app.meta["version"] = "1.0.0";
		#if !flash
		var attribs:WindowAttributes = {
			allowHighDPI: true,
			alwaysOnTop: false,
			borderless: #if borderless_window true #else false #end,
			context: {
				antialiasing: 0,
				background: 0x000000,
				colorDepth: 32,
				depth: true,
				hardware: true,
				stencil: true,
				type: null,
				vsync: false
			},
			element: null,
			frameRate: 120,
			#if !web
			fullscreen: false,
			#end
			height: 1080,
			hidden: #if munit true #else false #end,
			maximized: false,
			minimized: false,
			parameters: {},
			resizable: true,
			title: "TNoS: Two Nights",
			width: 1920,
			x: null,
			y: null
		};
		if(app.window == null) {
			if(cfg != null) for(field in Reflect.fields(cfg)){
				if(Reflect.hasField(attribs, field)) Reflect.setField(attribs, field, Reflect.field(cfg, field));
				else if(Reflect.hasField(attribs.context,
					field)) Reflect.setField(attribs.context, field, Reflect.field(cfg, field));
			}
			#if sys System.__parseArguments(attribs); #end
		}
		app.createWindow(attribs);
		#elseif air
		#else
		#end
	}
	#end

}
