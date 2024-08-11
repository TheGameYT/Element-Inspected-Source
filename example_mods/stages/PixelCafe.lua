function onCreate()
	-- background shit
	makeLuaSprite('WallPixel', 'WallPixel', -600, -300);
	setScrollFactor('WallPixel', 1, 1);
	widShit = math.floor(getProperty('WallPixel.width') * 6);
	scaleObject('WallPixel', 6, 6);
	
	makeLuaSprite('FloorPixel', 'FloorPixel', -690, -200);
	setScrollFactor('FloorPixel', 1, 1);
	widShit = math.floor(getProperty('FloorPixel.width') * 6);
	scaleObject('FloorPixel', 6, 8);


	makeLuaSprite('SeatsPixel', 'SeatsPixel', -600, 200);
	setScrollFactor('SeatsPixel', 1, 1);
    widShit = math.floor(getProperty('SeatsPixel.width') * 6);
	scaleObject('SeatsPixel', 6, 6);
	
	makeLuaSprite('PaintingsPixel', 'PaintingsPixel', -600, 280);
	setScrollFactor('PaintingsPixel', 1, 1);
	scaleObject('PaintingsPixel', 1, 1);
	widShit = math.floor(getProperty('PaintingsPixel.width') * 6);
	scaleObject('PaintingsPixel', 6, 6);


	makeLuaSprite('OurpleSeatPixel', 'OurpleSeatPixel', -349, 300);
	setScrollFactor('OurpleSeatPixel', 1, 1);
	widShit = math.floor(getProperty('OurpleSeatPixel.width') * 6);
	scaleObject('OurpleSeatPixel', 5.7, 5.7);

	makeLuaSprite('GirlSeatPixel', 'GirlSeatPixel', -800, 300);
	setScrollFactor('GirlSeatPixel', 1, 1);
	widShit = math.floor(getProperty('GirlSeatPixel.width') * 6);
	scaleObject('GirlSeatPixel', 5.5, 5.5);
	
	makeLuaSprite('Shiny', 'Shiny', -2900, 1250);
	scaleObject('Shiny', 0.95, 0.95);
	setScrollFactor('Shiny', 0.7, 1);


	makeLuaSprite('Flame', 'Flame', -2500, 850);
	scaleObject('Flame', 0.95, 0.95);
	setScrollFactor('Flame', 0.7, 1);


	
	makeLuaSprite('shadowwizardmoneygangwelovecastingspellsPixel', 'shadowwizardmoneygangwelovecastingspellsPixel', -600, 400);
	setScrollFactor('shadowwizardmoneygangwelovecastingspellsPixel', 0.7, 1);
    scaleObject('shadowwizardmoneygangwelovecastingspellsPixel', 0.7, 0.7);
	widShit = math.floor(getProperty('shadowwizardmoneygangwelovecastingspellsPixel.width') * 6);
	scaleObject('shadowwizardmoneygangwelovecastingspellsPixel', 6, 6);


	makeLuaSprite('WhittyPixel', 'WhittyPixel', -700, 400);
	setScrollFactor('WhittyPixel', 0.7, 1);
    scaleObject('WhittyPixel', 0.7, 0.7);
	widShit = math.floor(getProperty('WhittyPixel.width') * 6);
	scaleObject('WhittyPixel', 6, 6);



	addLuaSprite('WallPixel', false);
	addLuaSprite('FloorPixel', false);
	addLuaSprite('SeatsPixel', false);
	addLuaSprite('PaintingsPixel', false);
	addLuaSprite('OurpleSeatPixel', false);
	addLuaSprite('GirlSeatPixel', false);

	addLuaSprite('Flame', true);
	addLuaSprite('Shiny', true);
	addLuaSprite('shadowwizardmoneygangwelovecastingspellsPixel', true);
	addLuaSprite('WhittyPixel', true);
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
	if curStep == 797 then
		removeLuaSprite("WhittyPixel", true)
		removeLuaSprite("shadowwizardmoneygangwelovecastingspellsPixel", true)
	end
end