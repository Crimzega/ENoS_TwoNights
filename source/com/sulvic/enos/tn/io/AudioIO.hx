package com.sulvic.enos.tn.io;

/** @author Crimzega */
class AudioIO{

	static function getLibraryPath(?library:String):String{
		var basePath = "assets";
		if(library == null) basePath += "/common";
		else{
			
		}
		return basePath;
	}

	public static function getMusic(path:String, ?library:String):String{ return '${getLibraryPath(library)}/music/$path.wav'; }

	public static function getSound(path:String, ?library:String):String{ return '${getLibraryPath(library)}/sounds/$path.flac'; }

}
