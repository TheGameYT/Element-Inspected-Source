function onCountdownStarted()
  makeLuaSprite("IntegerCard", "IntegerCard", 1000, 545)
  setObjectCamera('IntegerCard', 'camHUD')
  setProperty('IntegerCard.alpha', 0)
  addLuaSprite('IntegerCard', true)
  doTweenAlpha('things3', 'IntegerCard', 1, 0.9, 'expoIn');
end
function onBeatHit()

    if curBeat % 16 == 8 then
      doTweenX("things3", "IntegerCard", 1900, 4, "sineIn")   --doTweenAlpha('things3', 'NullCredit', 0, 1.5, 'linear');
    end
   
end

function onStepHit()
	if curStep == 127 then
    removeLuaSprite("IntegerCard", true)
  end
end