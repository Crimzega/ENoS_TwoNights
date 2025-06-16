package com.sulvic.twonights;

#if macro
import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Type;
#end
import openfl.events.Event;

#if !macro
@:build(DocumentTN.build())
@:keep
@:dox(hide)
#end
class DocumentTN #if !macro extends TwoNights #end{

	#if macro
	public static macro function build():Array<Field>{
		var clsType:ClassType = Context.getLocalClass().get();
		while(clsType != null) {
			if(clsType.module == "openfl.display.DisplayObject" || clsType.module == "flash.display.DisplayObject") {
				var fields:Array<Field> = Context.getBuildFields();
				fields.push({
					name: "new",
					access: [Access.APublic],
					kind: FieldType.FFun({
						args: [
							{
								name: current,
								opt: false,
								type
								macro :openfl.display.DisplayObjectContainer,
								value: null
							}
						],
						expr: macro{
							current.addChild(this);
							super();
							dispatchEvent(Event.ADDED_TO_STAGE, false, false);
						},
						params: [],
						ret: macro :Void
					}),
					pos: Context.currentPos()
				});
				return fields;
			}
			if(clsType.superClass != null) clsType = clsType.superClass.t.get();
			else clsType = null;
		}
	}
	#end

}
