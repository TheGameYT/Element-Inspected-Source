/*
    important note: 
    for make foreground objects invisibe when the event happends just do this so it is not a Vs Mouse 2.5 V2 momento 
    (lua example btw cus i bet yall use it lmao)
    
    function onEvent(name, val1)
        if name == 'good apple' then
            if val1 == 'on' then -- makes the object invisible if on
                setProperty('object.alpha', 0.001) -- 0.001 just in case the game kills itself by null attacks
            elseif val1 == 'off' then -- if off makes the object visible
                setProperty('object.alpha', 0.001)
            end
        end
    end
*/

var blackJumpscare:FlxSprite;

function onCreate()
{
    blackJumpscare = new FlxSprite(-FlxG.width * FlxG.camera.zoom,
        -FlxG.height * FlxG.camera.zoom).makeGraphic(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
    blackJumpscare.scrollFactor.set();
    blackJumpscare.alpha = 0;
    game.addBehindGF(blackJumpscare); // in case some of yall dont have 0.7.1h
}

function onEvent(name:String, value1:String, value2:String)
{
    var fVal2:Float = Std.parseFloat(value2); // lazy lmao

    if (name == 'good apple') 
    {
        if (value1 == 'on')
        {
            FlxTween.tween(blackJumpscare, {alpha: 1}, fVal2, {ease: FlxEase.sineInOut});

            // can't use flxtween.color cus it sets the color transform offset
            FlxTween.tween(PlayState.instance.boyfriend.colorTransform, {blueOffset: 255, redOffset: 255, greenOffset: 255}, fVal2, {ease: FlxEase.sineInOut});
            FlxTween.tween(PlayState.instance.dad.colorTransform, {blueOffset: 255, redOffset: 255, greenOffset: 255}, fVal2, {ease: FlxEase.sineInOut});
            if (PlayState.instance.gf != null)
                FlxTween.tween(PlayState.instance.gf.colorTransform, {blueOffset: 220, redOffset: 220, greenOffset: 220}, fVal2, {ease: FlxEase.sineInOut});
        } else if (value1 == 'off')
        {
            FlxTween.tween(blackJumpscare, {alpha: 0}, fVal2, {ease: FlxEase.sineInOut});

            // can't use flxtween.color cus it sets the color transform offset
            FlxTween.tween(PlayState.instance.boyfriend.colorTransform, {blueOffset: 0, redOffset: 0, greenOffset: 0}, fVal2, {ease: FlxEase.sineInOut});
            FlxTween.tween(PlayState.instance.dad.colorTransform, {blueOffset: 0, redOffset: 0, greenOffset: 0}, fVal2, {ease: FlxEase.sineInOut});
            if (PlayState.instance.gf != null)
                FlxTween.tween(PlayState.instance.gf.colorTransform, {blueOffset: 0, redOffset: 0, greenOffset: 0}, fVal2, {ease: FlxEase.sineInOut});
        }
    }
}