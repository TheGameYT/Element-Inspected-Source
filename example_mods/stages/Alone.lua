function onCreate()
	-- background shit
	makeLuaSprite('Wall', 'Wall', -600, -300);
	setScrollFactor('Wall', 1, 1);
	scaleObject('Wall', 1, 1);
	
	makeLuaSprite('Floor', 'Floor', -690, -200);
	setScrollFactor('Floor', 1, 1);
	scaleObject('Floor', 1.1, 0.9);


	makeLuaSprite('Seats', 'Seats', -600, -300);
	setScrollFactor('Seats', 1, 1);

	
	makeLuaSprite('Paintings', 'Paintings', -600, 0);
	setScrollFactor('Paintings', 1, 1);
	scaleObject('Paintings', 1, 1);



	makeLuaSprite('OurpleSeatG', 'OurpleSeatG', 549, 200);
	setScrollFactor('OurpleSeatG', 1, 1);
	scaleObject('OurpleSeatG', 0.7, 0.7);

	makeLuaSprite('GirlSeatG', 'GirlSeatG', -600, 200);
	setScrollFactor('GirlSeatG', 1, 1);
	scaleObject('GirlSeatG', 0.7, 0.7);
	
	makeLuaSprite('ShinyG', 'ShinyG', -2900, 1250);
	scaleObject('ShinyG', 0.95, 0.95);
	setScrollFactor('ShinyG', 0.7, 1);


	makeLuaSprite('FlameG', 'FlameG', -2500, 850);
	scaleObject('FlameG', 0.95, 0.95);
	setScrollFactor('FlameG', 0.7, 1);


	
	makeLuaSprite('shadowwizardmoneygangwelovecastingspellsG', 'shadowwizardmoneygangwelovecastingspellsG', -600, 400);
	setScrollFactor('shadowwizardmoneygangwelovecastingspellsG', 0.7, 1);
    scaleObject('shadowwizardmoneygangwelovecastingspellsG', 0.7, 0.7);


	makeLuaSprite('WhittyRG', 'WhittyRG', 100, 400);
	setScrollFactor('WhittyRG', 0.7, 1);
    scaleObject('WhittyRG', 0.7, 0.7);



	addLuaSprite('Wall', false);
	addLuaSprite('Floor', false);
	addLuaSprite('Seats', false);
	addLuaSprite('Paintings', false);
	addLuaSprite('OurpleSeatG', false);
	addLuaSprite('GirlSeatG', false);

	addLuaSprite('FlameG', true);
	addLuaSprite('ShinyG', true);
	addLuaSprite('shadowwizardmoneygangwelovecastingspellsG', true);
	addLuaSprite('WhittyRG', true);
end

function onUpdate()
	if curBeat % 2 == 1 then
		doTweenY('YayFlame', 'FlameG', 890, 0.1, 'bounce')
		doTweenY('YayShiny', 'ShinyG', 1290, 0.1, 'bounce')
	end
	if curBeat % 4 == 1 then
		doTweenY('YayFlame2', 'FlameG', 850, 0.1, 'bounce')
		doTweenY('YayShiny2', 'ShinyG', 1250, 0.1, 'bounce')
	end
end

function onEvent(name, value1, value2)
    if name == 'Set Text' then
		doTweenX('MovieFlame', 'FlameG', 2500, 11.5, 'linear')
		doTweenX('MovieShiny', 'ShinyG', 2900, 12.5, 'linear')
    end
end

function onStepHit(curStep)
	if curStep == 1376 then
		removeLuaSprite("WhittyRG", true)
		removeLuaSprite("shadowwizardmoneygangwelovecastingspellsG", true)
		removeLuaSprite("GirlSeatG", true)
		removeLuaSprite("OurpleSeatG", true)
	end
end
function onStepHit()
	if curStep == 1375 then
		removeLuaSprite("WhittyRG", true)
		removeLuaSprite("shadowwizardmoneygangwelovecastingspellsG", true)
	end
end