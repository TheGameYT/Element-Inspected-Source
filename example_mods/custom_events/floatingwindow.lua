x = 0
balls = 0
function onCreatePost()

	hmm = getPropertyFromClass("openfl.Lib", "application.window.x")
	hmm2 = getPropertyFromClass("openfl.Lib", "application.window.y")

end

function onEvent(name, value1, value2)

	if name == 'floatingwindow' then

		if value1 == 1 then
			balls = 1
		end

		if value1 == 0 then
			balls = 0
		end

	end	

end

function onUpdate()

	if balls == 1 then

		x = x + 1
		y = math.sin(x / 200)
		y2 = math.sin(x / 60)

		setPropertyFromClass("openfl.Lib", "application.window.x", hmm + y * 400)
		setPropertyFromClass("openfl.Lib", "application.window.y", hmm2 + y2 * 80)

	end

end
