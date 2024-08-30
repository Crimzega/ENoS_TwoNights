(function($hxExports, $global){
	"use strict";
	$hxScript = (function(exports, global){::SOURCE_FILE::})();
	$hxExports.lime = $hxExports.lime || {};
	$hxExports.lime.$scripts = $hxExports.lime.$scripts || {};
	$hxExports.lime.embed = function(projName){
		var exports = {}, script = $hxExports.lime.$scripts[projName];
		if(!script) throw Error(`Cannot find project name "${projName}"`);
		script(exports, $global);
		for(key in exports) $hxExports[key] = $hxExports[key] || exports[key];
		var lime = exports.lime || window.lime;
		if(lime && lime.embed && lime.embed != this) lime.embed.apply(lime, arguments);
		return exports;
	}
})(
	typeof exports != "undefined"? exports: typeof define == "function"&& define.amd? {}: typeof window != "undefined"?
		window: typeof self != "undefined"? self: this,
	typeof window != "undefined"? window: typeof global != "undefined"? global: typeof self != "undefined"? self: this
)
