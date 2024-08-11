function onEvent(name, value1, value2)
	if name == 'move arrows Y' then
	noteTweenY('NOTEMOVE5', 4, value1, value2, 'circInOut')
	noteTweenY('NOTEMOVE6', 5, value1, value2, 'circInOut')
	noteTweenY('NOTEMOVE7', 6, value1, value2, 'circInOut')
	noteTweenY('NOTEMOVE8', 7, value1, value2, 'circInOut')
	end
end