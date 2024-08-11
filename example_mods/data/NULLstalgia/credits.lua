function onCountdownStarted()
  makeLuaSprite("NullCredit", "NullCredit", 1000, 545)
  setObjectCamera('NullCredit', 'camHUD')
  setProperty('NullCredit.alpha', 0)
  addLuaSprite('NullCredit', true)
  doTweenAlpha('things3', 'NullCredit', 1, 1.5, 'expoIn');
end
function onBeatHit()

    if curBeat % 16 == 8 then
      doTweenX("things3", "NullCredit", 1900, 2, "sineIn")   --doTweenAlpha('things3', 'NullCredit', 0, 1.5, 'linear');
    end
   
end

function onStepHit()
	if curStep == 127 then
    removeLuaSprite("NullCredit", true)
  end
end