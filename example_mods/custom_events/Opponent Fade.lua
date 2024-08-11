-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'Opponent Fade' then
		duration = tonumber(value1);
		if duration < 0 then
			duration = 0;
		end

		targetAlpha = tonumber(value2);
		if targetAlpha < 0 then
			targetAlpha = 0;
		end

		if duration == 0 then
			setProperty('dad.alpha', targetAlpha);
			setProperty('iconP2.alpha', targetAlpha);
			for i = 0, 3 do
				setPropertyFromGroup('opponentStrums', i, 'alpha', targetalpha);
				--setProperty('opponentStrums.alpha', targetalpha);
			end
		else
			doTweenAlpha('dadFadeEventTween', 'dad', targetAlpha, duration, 'linear');
			doTweenAlpha('iconDadFadeEventTween', 'iconP2', targetAlpha, duration, 'linear');
			for i = 0, 3 do
				doTweenAlpha('dadNotesFadeEventTween', 'opponentStrums', i, 'alpha', targetAlpha, duration, 'linear');
				--noteTweenAlpha('dadNotesFadeEventTween', i, targetAlpha, duration, 'linear');
			end
		end
		--debugPrint('Event triggered: ', name, duration, targetAlpha);
	end
end