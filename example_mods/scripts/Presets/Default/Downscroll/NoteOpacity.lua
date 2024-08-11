local pref = {
	Alpha = 0.75 --Set opacity for notes
}

function onUpdate()
	for i = 0, 3 do
		setPropertyFromGroup('game.opponentStrums', i, 'alpha', pref.Alpha)
		setPropertyFromGroup('game.playerStrums', i, 'alpha', pref.Alpha)
	end
end
