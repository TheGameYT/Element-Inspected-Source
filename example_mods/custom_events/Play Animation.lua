
function onEvent(name,value1,value2)
	if name == 'Play Animation' then --name of the event to be used
		
		if value1 == 'bgnormal' then --put the normal bg
			setProperty('Flamesday.visible', true);
			setProperty('stage2.visible', false);
			setProperty('stage3.visible', false);
			setProperty('stage4.visible', false);
		end
		if value1 == 'bg1' then --put the 1 bg
			setProperty('Flamesday.visible', false);
			setProperty('FDB.visible', true);
			setProperty('stage3.visible', false);
			setProperty('stage4.visible', false);
		end
		if value1 == 'bg2' then --put the 2 bg
			setProperty('stage.visible', false);
			setProperty('stage2.visible', false);
			setProperty('stage3.visible', true);
			setProperty('stage4.visible', false);
		end
		if value1 == 'bg3' then --put the 3 bg
			setProperty('stage.visible', false);
			setProperty('stage2.visible', false);
			setProperty('stage3.visible', false);
			setProperty('stage4.visible', true);
		end
	end
end