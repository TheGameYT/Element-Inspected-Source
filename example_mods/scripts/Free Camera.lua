freecamZoom = 0
freecamX = 0
freecamY = 0
defcamZoom = 0
freecamAngle = 0
tenX = false
canPause = true
freecam = false
resumeSong = true
function onCreatePost()
	freecamZoom = getProperty('defaultCamZoom')
	defcamZoom = getProperty('defaultCamZoom')
	
	makeLuaSprite('instructions', 'Instructions', 13, 13)
	setProperty('instructions.alpha', 0)
	setObjectCamera('instructions', 'other')
	
	addLuaSprite('instructions')
end

function onUpdatePost(elapsed)
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.C') and canPause and not freecam then
	    setProperty('boyfriend.stunned', true);
		setProperty('dad.stunned', true);
		setProperty('gf.stunned', true);
		freecamX = getProperty('camFollow.x')
		freecamY = getProperty('camFollow.y')
	    canPause = false
		freecam = true
		resumeSong = false		
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
		setProperty('vocals.volume', 0)
		setProperty('camHUD.alpha', 0)
		runTimer('canPause', 0.5)
		setProperty('instructions.alpha', 1)
		triggerEvent('Camera Follow Pos', freecamX, freecamY)
	end
	if not resumeSong then
		setPropertyFromClass('Conductor', 'songPosition', getPropertyFromClass('Conductor', 'songPosition') - elapsed * 1000  ) -- it is counted by milliseconds, 1000 = 1 second
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
		setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ESCAPE') and not canPause and freecam then
		setProperty('boyfriend.stunned', false);
		setProperty('dad.stunned', false);
		setProperty('gf.stunned', false);
		setProperty('defaultCamZoom', defcamZoom)
		triggerEvent('Camera Follow Pos', '', '')
	    canPause = true
		freecam = false
		resumeSong = true
		freecamZoom = defcamZoom
		freecamAngle = 0
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 1)
		setProperty('vocals.volume', 1)
		setProperty('camHUD.alpha', 1)
		setProperty('instructions.alpha', 0)
		setProperty('cpuControlled', false)
		setProperty('camGame.angle', 0)
		setProperty('showRating', true)
		setProperty('showComboNum', true)
	end
	freecamActions()
	if freecam then
		triggerEvent('Camera Follow Pos', freecamX, freecamY)
		setProperty('defaultCamZoom', freecamZoom)
		setProperty('camGame.angle', freecamAngle)
		setProperty('showRating', false)
		setProperty('showComboNum', false)
	end
end

function onPause()
    if not canPause then
	    return Function_Stop;
	else
             
	end
end

function freecamActions()
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.E') and freecam then
		if not tenX then
			freecamZoom = freecamZoom + .01
		else
			freecamZoom = freecamZoom + .1
		end
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Q') and freecam then
		if not tenX then
			freecamZoom = freecamZoom - .01
		else
			freecamZoom = freecamZoom - .1
		end
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.W') and freecam then
		freecamZoom = defcamZoom
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.J') and freecam then
		if not tenX then
			freecamX = freecamX - 1
		else
			freecamX = freecamX - 10
		end
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.L') and freecam then
		if not tenX then
			freecamX = freecamX + 1
		else
			freecamX = freecamX + 10
		end
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.I') and freecam then
		if not tenX then
			freecamY = freecamY - 1
		else
			freecamY = freecamY - 10
		end
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.K') and freecam then
		if not tenX then
			freecamY = freecamY + 1
		else
			freecamY = freecamY + 10
		end
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.A') and freecam then
		if not tenX then
			freecamAngle = freecamAngle - 1			
		else
			freecamAngle = freecamAngle - 10
		end
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.D') and freecam then
		if not tenX then
			freecamAngle = freecamAngle + 1	
		else
			freecamAngle = freecamAngle + 10
		end
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.S') and freecam then
		freecamAngle = 0
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and freecam then
		if resumeSong then
			resumeSong = false		
			setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
			setProperty('vocals.volume', 0)
			setProperty('dad.stunned', true);
			setProperty('gf.stunned', true);
		else
			resumeSong = true
			setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 1)
			setProperty('vocals.volume', 1)
			setProperty('dad.stunned', false);
			setProperty('gf.stunned', false);
		end
	end	
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and freecam then
		if not getProperty('cpuControlled') then
			setProperty('cpuControlled', true)
		else
			setProperty('cpuControlled', false)
		end
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Z') and freecam then
		if getProperty('camHUD.alpha') == 1 then
			setProperty('camHUD.alpha', 0)
		else
			setProperty('camHUD.alpha', 1)
		end
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.X') and freecam then
		if getProperty('instructions.alpha') == 1 then
			setProperty('instructions.alpha', 0)
		else
			setProperty('instructions.alpha', 1)
		end
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') and freecam then
		if not tenX then
			tenX = true
		else
			tenX = false
		end
	end
end