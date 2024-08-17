package com.sulvic.enos_tn.api;

import flixel.addons.api.FlxGameJolt;

class GameJoltApi{

    public static function init():Void{
        FlxGameJolt.init(ApiHelper.gameJoltGID, ApiHelper.gameJoltKey);
    }

    public static function auth(user:String, token:String){
        FlxGameJolt.authUser(user, token);
    }

}
