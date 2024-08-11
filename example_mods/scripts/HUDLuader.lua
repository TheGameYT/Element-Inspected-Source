local dah = {'Healthbar', 'HUD', 'Icons', 'Judgements', 'NoteOpacity'} 
-- These are the scripts to load (You can add your own scripts)
local pref = {
	['Preset'] = 'Default', --Change the folder of the scripts that will be load
	Downscroll = true --Enable this if some HUD stuff is missplaced
}

function onCreate()
	luaDebugMode = true
	for _, scripts in ipairs(dah) do 	addLuaScript("scripts/Presets/"..pref['Preset']..'/'..scripts)
	end
	if downscroll == true then
	for _, scripts in ipairs(dah) do 	addLuaScript("scripts/Presets/"..pref['Preset']..'/Downscroll/'..scripts)
	end
end
end

-- HOW TO CREATE PRESETS
-- 1. Copy and paste the Default Folder on Presets folder
-- 2. Modify the code as you like
-- 3. Change the preset option to your new preset name
-- 4. HUD loaded and ready to use :D

-- HOW TO ADD PRESETS
-- 1. Download the zipped Preset
-- 2. Extract the folder on Presets folder (If there are images on the preset make sure put it on DiamondHUD/Images folder)
-- 3. Change the Preset option to the downloaded preset name
-- HUD loaded and ready to use :D