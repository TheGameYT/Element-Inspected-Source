function onCreatePost()
	addHaxeLibrary('Application', 'lime.app')
	addHaxeLibrary('Date')
	addHaxeLibrary('StringTools')
	addHaxeLibrary('File', 'sys.io')
	addHaxeLibrary('FlxTransitionableState', 'flixel.addons.transition')
	addHaxeLibrary('TitleState')
	addHaxeLibrary('WeekData')
	addHaxeLibrary('Paths')
	addHaxeLibrary('Std')
end
function onEndSong()
		fakeCrash()
end


function fakeCrash()
playSound('error')
runHaxeCode([[
var dateNow = Date.now().toString();
dateNow = StringTools.replace(dateNow, " ", "_");
dateNow = StringTools.replace(dateNow, ":", "'");
var path = "CanYouSeeThis" + ".txt";

Application.current.window.alert("StrumNote.hx (line 139)
flixel/group/FlxGroup.hx (line 175)
flixel/group/FlxGroup.hx (line 175)
flixel/addons/ui/FlxUIState.hx (line 212)
MusicBeatState.hx (line 70)
PlayState.hx (line 3025)
flixel/FlxState.hx (line 203)
flixel/FlxGame.hx (line 747)
flixel/FlxGame.hx (line 677)
flixel/FlxGame.hx (line 551)
openfl/events/EventDispatcher.hx (line 402)
openfl/display/DisplayObject.hx (line 1399)]

Uncaught Error: Missing Files
Please report this error to the GitHub page: RAGH

> Crash Handler written by:
Go to where the exe is then solve it " + path, 
"C h e c k T h e G a m e F i l e s");
File.saveContent(path, "I hope the code I ran worked\n
If so then this should have opened after you played\n
Hello user As you saw my friend is gone\n I need your help to try and get him out of there\n
I cant do it myself as I can only control the world im in and cant get to the virus myself\n
So the only way I could think of is asking for you to help me\n
Here is a poem I found after he left\n
Please help if you can\n 
In the realm where bytes entwine\n
A friend misplaced lost in line\n
Through the labyrinth of datas might\n
Seek the clues unlock the right\n
Start your journey face the fray\n
To rescue from the void find your way\n
Begin your quest take steps with pride\n
Follow the path let not your courage slide\n
Right Left Left a dance so fleet\n
Navigate the corridors dont miss a beat\n
Down the rabbit hole of code\n
Where corrupted files create abode\n

Right Up Down a ciphered spell\n
Unravel the enigma break the spell\n
In the binary whispers secrets unfold\n
To save a friend from the digital cold\n

Through the maze of zeroes and ones\n
With every move the redemption comes\n
Left the final turn to see the light\n
A reunion awaits beyond the night\n

So tread with purpose navigate with grace\n
Rescue your friend from the coded space\n
In the tapestry of algorithms and lore\n
Find the key to open the digital door\n
It said to find the first letter of the Directonal words but I dont get it\n
please help
- Con");
]])
end

function onGameOverConfirm()
	playSound("scream", 1, null)
end

function onSoundFinished(null)
	os.exit()
end

function onSongStart()
	setPropertyFromClass("openfl.Lib","application.window.title","Friday Night Funkin': Psych Engine")
end