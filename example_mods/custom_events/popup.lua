windowAmount = 0

function onEvent(name,va1,va2)
    	addHaxeLibrary("Sys")
	addHaxeLibrary("Application", "lime.app")
	addHaxeLibrary("Lib", "openfl")
	addHaxeLibrary("Paths")
	addHaxeLibrary("Sprite", "openfl.display")
	addHaxeLibrary("FlxSprite", "flixel")
	addHaxeLibrary("Matrix", "flixel.math")
	local garbungle='wind'
	for i=1,windowAmount,1 do
		garbungle=garbungle..'o'
	end
	garbungle=garbungle..'ne'
	if name == 'popup' then
		windowAmount = windowAmount+1
		--debugPrint('FUCK YOU ',windowAmount,'000')
		setPropertyFromClass("flixel.FlxG", "autoPause", false) --lol
        	runHaxeCode([[
			]]..garbungle..[[ = Lib.application.createWindow({
			x: 0,
			y: 0,
			width: 400,
			height: 400,
			title:"]]..va2..[[",
			borderless: false,
			alwaysOnTop: true
			});
    		var cock = function() { //this is the function that closes the window when it's clicked, then decrements windowamt
    			//CoolUtil.browserLoad("https://www.youtube.com/watch?v=T2v0M9agvQU");
			]]..garbungle..[[.close();
    			//Sys.command('start "./mods/]]..getPropertyFromClass('Paths', 'currentModDirectory')..[[/webpages\scamboned.html");
    		};
    		var gock = function() { //this is the function that decrements the windowamount anyway
			game.callOnLuas('closedPopsWindow',[]);
    		};
		var bg = new FlxSprite().loadGraphic(Paths.image("]]..va1..[["));
		//add(bg);
		var spriite = new Sprite();
    		]]..garbungle..[[.onMouseDown.removeAll();
        	]]..garbungle..[[.onMouseDown.add(cock,true);
        	]]..garbungle..[[.onClose.add(gock,true);

		var m = new Matrix();
		spriite.graphics.beginBitmapFill(bg.pixels, m);
		spriite.graphics.drawRect(0, 0, bg.pixels.width, bg.pixels.height);
		spriite.graphics.endFill();
		FlxG.mouse.useSystemCursor = true;
		]]..garbungle..[[.stage.addChild(spriite);
        ]])
	end
end
function onPause() --REMOVE THIS IF IT'S INTERFERING WITH UR CUSTOM PAUSE SCREEN
	if windowAmount>0 then return Function_Stop else return Function_Continue end
end
function closedPopsWindow()
	windowAmount = windowAmount-1
end
function onDestroy()
	setPropertyFromClass("flixel.FlxG", "autoPause", true)
end