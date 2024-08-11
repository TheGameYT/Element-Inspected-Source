local EventTextWidth = 120

function onCreate()
	makeLuaText('AnyTextEvent', '', 600, 100, 500);
	setTextSize('AnyTextEvent', 40);
	setTextAlignment('AnyTextEvent', 'center');
	setObjectCamera('AnyTextEvent', 'other');
	addLuaText('AnyTextEvent');
end

function onEvent(name, v1,v2)
	if name == "Set Text" then
		setTextString('AnyTextEvent', v1);
		if v2 == '' then
			-- do nothing
		else
			setTextColor('AnyTextEvent', v2);
		end
	end
end