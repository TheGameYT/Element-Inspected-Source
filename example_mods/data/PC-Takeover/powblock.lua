function onStepHit()
	if curStep == 1 then
        makeLuaSprite("cuidao0", notext, 100, 100)
        scaleLuaSprite("notext", 10, 10)
        addLuaSprite("notext", true)
        runTimer("timer1", 1, 1)
end
end
