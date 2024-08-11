package;

import flixel.FlxState;

import flixel.FlxG;

import flixel.util.FlxTimer;

import openfl.utils.Assets as OpenFlAssets;

import flixel.FlxG;

import flixel.FlxSprite;

import flixel.FlxSubState;

import flixel.util.FlxColor;

import flixel.group.FlxGroup;

import flixel.system.FlxAssets.FlxGraphicAsset;


#if VIDEOS_ALLOWED

import vlc.MP4Handler;

#end



#if sys

import sys.FileSystem;

import sys.io.File;

#end



using StringTools;



class Intro extends FlxState

{  

   

    override function create()

    {

        new FlxTimer().start(1, function(guh:FlxTimer) // gives a bit delay

        {

            startVideo('HaxeGlitch'); //put the video name here make sure the video on videos folder. you dont need to add like blabla.mp4 just blabla

        });


    }

 


    override function update(elapsed)

    {

     if (FlxG.keys.justPressed.SPACE || FlxG.keys.justPressed.ENTER)   FlxG.switchState(new TitleState()); //uncomment this so if you press space or enter the intro will be skipped

    }


     


    function startVideo(name:String)


        {

            #if VIDEOS_ALLOWED

            var filepath:String = Paths.video(name);

            #if sys

            if(!FileSystem.exists(filepath))

            #else

            if(!OpenFlAssets.exists(filepath))

            #end

            {


                FlxG.log.warn('Couldnt find video file: ' + name);


                return;


            }


            var video:MP4Handler = new MP4Handler();

            video.playVideo(filepath);

            video.finishCallback = function()

            {


                FlxG.switchState(new TitleState()); //this will make after the video done it will switch to the intro text/ title state

                return;

            }

            #else

            FlxG.log.warn('Platform not supported!');

            return;

            #end

        }

}
