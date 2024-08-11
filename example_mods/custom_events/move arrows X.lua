function onEvent(name, value1, value2)
	if name == 'move arrows X' then
	noteTweenX(defaultPlayerStrumX0, 4, value1 - 168, value2, circInOut)
	noteTweenX(defaultPlayerStrumX1, 5, value1 - 57, value2, circInOut)
	noteTweenX(defaultPlayerStrumX2, 6, value1 + 57, value2, circInOut)
	noteTweenX(defaultPlayerStrumX3, 7, value1 + 168, value2, circInOut)
	end
end