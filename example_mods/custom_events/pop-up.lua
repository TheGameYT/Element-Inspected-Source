function onEvent(name, value1, value2)
	if name == "pop-up" then
		popx = math.random(0,1000)
		popy = math.random(0,500)
		makeAnimatedLuaSprite('image', value1, popx, popy);
		addAnimationByPrefix('image', 'idle', 'MarkovWindow', 24, false)
		scaleObject('image', 1.2, 1.2);
		addLuaSprite('image', true);
		doTweenColor('hello', 'image', 0.5, 'quartIn');
		setObjectCamera('image', 'hud');
		objectPlayAnimation('image', 'idle', true);
		runTimer('wait', value2);
	end
end

function onTimerCompleted(tag, loops, loopsleft)
	if tag == 'wait' then
		doTweenAlpha('byebye', 'image', 0, 0.3, 'linear');
	end
end

function onTweenCompleted(tag)
	if tag == 'byebye' then
		removeLuaSprite('image', true);
	end
end