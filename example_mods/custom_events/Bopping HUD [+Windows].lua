function onEvent(name, value1, value2)
	if name == 'Bopping HUD [+Windows]' then
		cameraFlash('camGame', 'FFFFFF', 1, true)
		cameraFlash('camHUD', 'FFFFFF', 1, true)

		v1 = value1
		v2 = value2
	end
end

function onBeatHit()
	if curBeat % 2 == 0 then
		setProperty('camHUD.y', v1*80)
		doTweenY('hudTween', 'camHUD', 0, 0.5, 'backOut')
                setProperty('camGame.y', v1*80)
		doTweenY('gameTween', 'camGame', 0, 0.5, 'backOut')
					setPropertyFromClass("openfl.Lib", "application.window.y", getPropertyFromClass("openfl.Lib", "application.window.y") + 80)
	else
		setProperty('camHUD.y', v1*-80)
		doTweenY('hudTween', 'camHUD', 0, 0.5, 'backOut')
                setProperty('camGame.y', v1*-80)
		doTweenY('gameTween', 'camGame', 0, 0.5, 'backOut')
					setPropertyFromClass("openfl.Lib", "application.window.y", getPropertyFromClass("openfl.Lib", "application.window.y") - 80)
	end
end