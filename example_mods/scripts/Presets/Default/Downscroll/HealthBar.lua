-- Settings --
local pref = {
	HideHB = false,                --Hides healthbar. Works better if HideIcons is enabled in Icons.lua (Why would do that)
	CoolioHB = false,             -- Improve le healthbar
	ImageSprite = 'thayHealthBar', -- Image that will improve le healthbar
	ImageSpriteX = 287,
	ImageSpriteY = 20,
	HealthBarX = 348,             --Healthbar X?!!
	HealthBarY = 75,	--Healthbar Y?!!
	HealthTextX = 590,	--X For Health text
	HealthTextY = 635,	--Y for Health Text
	
}

function onCreatePost()
	setProperty('healthBar.x', pref.HealthBarX)
	setProperty('healthBar.y', pref.HealthBarY)

	if (pref.CoolioHB) then
		makeLuaSprite('Health', pref.ImageSprite)
		setProperty('Health.x', pref.ImageSpriteX)
		setProperty('Health.y', pref.ImageSpriteY)
		setObjectCamera('Health', 'hud')
		addLuaSprite('Health', true)
		setObjectOrder('Health', getObjectOrder('healthBar') + 1)
		setProperty('healthBar.visible', true)
	end
	
	if (pref.HideHB) then
		setProperty('healthBar.visible', false)
		setProperty('healthBarBG.visible', false)
		setProperty('iconP1.visible', false)
		setProperty('iconP2.visible', false)
		setProperty('Health.visible', false)
		makeLuaText('healthText', 'Health: ' .. math.floor(getProperty("health") * 50), 0, pref.HealthTextX, pref.HealthTextY)
		addLuaText('healthText')
		setTextSize('healthText', 20);
		setTextFont('healthText', 'funkin.ttf')
	end

	function onUpdate()
		setTextString('healthText', 'Health: ' .. math.floor(getProperty("health") * 50))
	end
end
