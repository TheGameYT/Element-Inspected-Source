function onCreate()
makeLuaSprite('white', '', 0, 0)
	makeGraphic('white', '2000', '2000', 'FFFFFF')
	setObjectCamera('white', 'other')
	setObjectOrder('white', 0)
	addLuaSprite('white', true)
	setProperty('white.alpha', 0)
end

function onEvent(n, v1, v2)
	if n == 'Flash White' then
		duration = tonumber(v2)
		if v1 == 'white' then
			if v2 == '' then
				setProperty('white.alpha', 1)
				doTweenAlpha('w0', 'white', 0, 1, 'linear')
			else
				setProperty('white.alpha', 1)
				doTweenAlpha('w0', 'white', 0, duration, 'linear')
			end
		end
    end
end