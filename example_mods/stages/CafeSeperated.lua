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


	makeLuaSprite('OurpleSeat', 'OurpleSeat', 549, 200);
	setScrollFactor('OurpleSeat', 1, 1);
	scaleObject('OurpleSeat', 0.7, 0.7);

	makeLuaSprite('GirlSeat', 'GirlSeat', -600, 200);
	setScrollFactor('GirlSeat', 1, 1);
	scaleObject('GirlSeat', 0.7, 0.7);
	
	makeLuaSprite('Shiny', 'Shiny', -2900, 1250);
	scaleObject('Shiny', 0.95, 0.95);
	setScrollFactor('Shiny', 0.7, 1);


	makeLuaSprite('Flame', 'Flame', -2500, 850);
	scaleObject('Flame', 0.95, 0.95);
	setScrollFactor('Flame', 0.7, 1);


	
	makeLuaSprite('shadowwizardmoneygangwelovecastingspells', 'shadowwizardmoneygangwelovecastingspells', -600, 400);
	setScrollFactor('shadowwizardmoneygangwelovecastingspells', 0.7, 1);
    scaleObject('shadowwizardmoneygangwelovecastingspells', 0.7, 0.7);


	makeLuaSprite('WhittyR', 'WhittyR', 100, 400);
	setScrollFactor('WhittyR', 0.7, 1);
    scaleObject('WhittyR', 0.7, 0.7);



	addLuaSprite('Wall', false);
	addLuaSprite('Floor', false);
	addLuaSprite('Seats', false);
	addLuaSprite('Paintings', false);
	addLuaSprite('OurpleSeat', false);
	addLuaSprite('GirlSeat', false);

	addLuaSprite('Flame', true);
	addLuaSprite('Shiny', true);
	addLuaSprite('shadowwizardmoneygangwelovecastingspells', true);
	addLuaSprite('WhittyR', true);
end

function onUpdate()
	if curBeat % 2 == 1 then
		doTweenY('YayFlame', 'Flame', 890, 0.1, 'bounce')
		doTweenY('YayShiny', 'Shiny', 1290, 0.1, 'bounce')
	end
	if curBeat % 4 == 1 then
		doTweenY('YayFlame2', 'Flame', 850, 0.1, 'bounce')
		doTweenY('YayShiny2', 'Shiny', 1250, 0.1, 'bounce')
	end
end

function onEvent(name, value1, value2)
    if name == 'Set Text' then
		doTweenX('MovieFlame', 'Flame', 2500, 11.5, 'linear')
		doTweenX('MovieShiny', 'Shiny', 2900, 12.5, 'linear')
    end
end

function onStepHit()
	if curStep == 542 then
		removeLuaSprite("WhittyR", true)
		removeLuaSprite("shadowwizardmoneygangwelovecastingspells", true)
	end
end


function onCreatePost()
triggerEvent("Set RTX Data", "0,0,0,0,0,0,0.21698599972777,0.080233518726288,0.26611110500541,0.26763033971559,0.26835076310169,0.58561895725294,150.69619725879,29.633930868396", nil)
end
