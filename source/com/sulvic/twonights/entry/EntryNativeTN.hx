package com.sulvic.twonights.entry;

import openfl.events.Event;
#if macro
import com.sulvic.twonights.DocumentTN;
import com.sulvic.twonights.preload.PreloaderTN;
import openfl.display.Preloader;
import haxe.macro.Compiler;
import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Type;
#end

@:access(lime.app.Application)
@:access(lime.system.System)
@:access(openfl.display.Stage)
@:access(openfl.events.UncaughtErrorEvents)
class EntryNativeTN{

	public static function start(stage:Stage):Void{
		if(stage.__uncaughtErrorEvents.__enabled) {
			try{
				EntryNativeTN.getEntryPoint();
				stage.dispatchEvent(new Event(Event.RESIZE, false, false));
			}
			catch (ex:Dynamic) {
				#if !display
				stage.__handleError(ex);
				#end
			}
		}
	}

	#if macro
	public static macro function getEntryPoint():Null<DocumentTN>{
		var type:Type = Context.follow(Context.getType("com.sulvic.twonights.TwoNights"));
	}

	public static macro function getPreloader():Preloader{}
	#end

}
