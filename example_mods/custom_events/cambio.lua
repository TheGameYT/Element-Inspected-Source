function onEvent(name,value1,value2)
	if name == 'cambio' then 
		
		if value1 == 'si' then
			setProperty('bgintro.visible', false);
        setProperty('INFERNO_SKY.visible', true);
			setProperty('ROCK_BG.visible', true);
		end
	end
end