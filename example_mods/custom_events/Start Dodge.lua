canDodge = false

dodged = false

attack = false

beatsLeft = 0

damage = 0

function onCreate()

	makeLuaSprite('space', 'space', 0, 0);
	scaleObject('space', 0.5, 0.5);
	setObjectCamera('space', 'hud');
	screenCenter('space');
	addLuaSprite('space', true);

	makeLuaText('counter', '0', 128, 0, 420);
	setTextColor('counter', '80ff80');
	setTextSize('counter', 64);
	screenCenter('counter', 'x');
	addLuaText('counter', true);

end

function onUpdatePost(elapsed)

	setTextString('counter', tostring(beatsLeft));

	setProperty('counter.y', getProperty('space.y') + 32);

	if keyboardJustPressed('SPACE') == true and attack == true then

		dodged = true

	end

	if canDodge == true and dodged == false then

		setProperty('space.alpha', 1);
		setProperty('counter.visible', true);

	else

		setProperty('space.alpha', 0);
		setProperty('counter.visible', false);

	end

end

function onEvent(name, value1, value2)

	-- handles event stuf

	if name == 'Start Dodge' then

		damage = tonumber(value1)
		beatsLeft = tonumber(value2)
		attack = true
		canDodge = true

	end

end

function onBeatHit(curBeat)

	setProperty('space.scale.x', 0.65);
	setProperty('space.scale.y', 0.65);
	doTweenX('d1', 'space.scale', 0.5, 0.25, 'sineOut');
	doTweenY('d2', 'space.scale', 0.5, 0.25, 'sineOut');

	if beatsLeft == 0 then

		if attack == true then

			if dodged == false then

				playSound('slash');
				playAnim('boyfriend', 'hurt');
				setHealth(getHealth() - damage)

			else

				playSound('zoromiss');
				playAnim('dad', 'singRIGHT');
				playAnim('boyfriend', 'dodge');

			end

		end

		attack = false
		canDodge = false
		dodged = false

	end

	if beatsLeft > 0 then

		beatsLeft = beatsLeft - 1

	end

end