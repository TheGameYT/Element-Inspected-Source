-- TODO: make work on upscroll

function onCreate()
    -- default psych functions are too length for my liking
    set = setProperty
    get = getProperty
    setFromClass = setPropertyFromClass
    getFromClass = getPropertyFromClass
    setFromGroup = setPropertyFromGroup
    getFromGroup = getPropertyFromGroup
end

function onCreatePost()
    -- fuck you psych   ui
    set("scoreTxt.visible", false)
    set("timeBar.visible", false)
    set("timeBarBG.visible", false)
    set("timeTxt.visible", false)

    -- make cool awesome blahaj ui   :tumb up:
    local coolY = (downscroll) and screenHeight - 70 or 0
    makeOutlinedText("blahaj_Score", "\n  "..formatNumber(100000000).."pts  \n\n", 20, 2.5, "418591", nil, 0, 20, coolY)
    makeOutlinedText("blahaj_Accuracy", "\n  ".."100".."% (SFC)  \n\n", 20, 2.5, "644191", "CFB1FF", 0, screenWidth, coolY)
    makeOutlinedText("blahaj_Misses", "\n  ".."0".." Misses  \n\n", 20, 2.5, "AE3B3B", "FF9D9D", 0, screenWidth, coolY)
    makeOutlinedText("blahaj_Time", "\n  0:00 / 0:00  \n\n", 20, 2.5, "418591", nil, 0, 20, coolY)

    setOutlinedTextAlignment("blahaj_Accuracy", "right")
    setOutlinedTextAlignment("blahaj_Misses", "right")

    for i = 0, get("strumLineNotes.length") do
        setFromGroup("strumLineNotes", i, "y", getFromGroup("strumLineNotes", i, "y") - (downscroll and 20 or -20))
    end
end

function addCharAtTheEndCorrectly(num, yummy, char)
    if num == 1 then return yummy end
    return yummy..char
end

function onUpdatePost()
    if get("ratingFC") == nil or get("ratingFC") == "" then
        set("ratingFC", "N/A")
    end

    setOutlinedTextString("blahaj_Score", "\n  "..formatNumber(get("songScore"))..addCharAtTheEndCorrectly(get("songScore"), "pt", "s").."  \n\n")
    setOutlinedTextString("blahaj_Accuracy", "\n  "..math.roundDecimal(get("ratingPercent") * 100, 2).."% ("..get("ratingFC")..")  \n\n")
    setOutlinedTextString("blahaj_Misses", "\n  "..formatNumber(get("songMisses"))..addCharAtTheEndCorrectly(get("songMisses"), " Miss", "es").."  \n\n")

    setOutlinedTextProperty("blahaj_Accuracy", "x", screenWidth - (get("blahaj_Accuracy_OUTLINE.width") + 20))
    setOutlinedTextProperty("blahaj_Misses", "x", (get("blahaj_Accuracy_OUTLINE.x") - get("blahaj_Misses_OUTLINE.width")) - 10)

    local songPos = getSongPosition()
    if songPos < 0 then songPos = 0 end

    setOutlinedTextString("blahaj_Time", "\n  "..string.formatTime(songPos / 1000).." / "..string.formatTime(getFromClass("flixel.FlxG", "sound.music.length") / 1000).."  \n\n")
    screenCenterOutlinedText("blahaj_Time", "X")
end

--[[
    helper functions
    because psych is uh amazing totally yes
]]--

function makeOutlinedText(tag, text, textSize, outlineSize, outlineColor, outlineColor2, fieldWidth, x, y)
    if outlineColor2 == nil then
        outlineColor2 = "FFFFFF"
    end

    txtName = tag.."_OUTLINE"
    makeLuaText(txtName, text, fieldWidth, x, y)
    setTextSize(txtName, textSize)
    setTextFont(txtName, "LilitaOne-Regular.ttf")
    setTextBorder(txtName, outlineSize * 2, outlineColor2)
    set(txtName..".antialiasing", true)
    addLuaText(txtName)

    txtName = tag
    makeLuaText(txtName, text, fieldWidth, x, y)
    setTextSize(txtName, textSize)
    setTextFont(txtName, "LilitaOne-Regular.ttf")
    setTextBorder(txtName, outlineSize, outlineColor)
    set(txtName..".antialiasing", true)
    addLuaText(txtName)
end

function setOutlinedTextString(tag, text)
    setTextString(tag.."_OUTLINE", text)
    setTextString(tag, text)
end

function screenCenterOutlinedText(tag, t)
    screenCenter(tag.."_OUTLINE", t)
    screenCenter(tag, t)
end

function setOutlinedTextAlignment(tag, alignment)
    setTextAlignment(tag.."_OUTLINE", alignment)
    setTextAlignment(tag, alignment)
end

function setOutlinedTextProperty(tag, prop, val)
    set(tag.."_OUTLINE."..prop, val)
    set(tag.."."..prop, val)
end

function formatNumber(number) -- number 15 burger king foot lettuce
    local i, j, minus, int, fraction = tostring(number):find('([-]?)(%d+)([.]?%d*)')
    int = int:reverse():gsub("(%d%d%d)", "%1,")
    return minus .. int:reverse():gsub("^,", "") .. fraction
end

function math.roundDecimal(num, numDecimalPlaces) -- stolen from stackoverflow :hue:
    local mult = 10 ^ (numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

function string.formatTime(seconds, showMS)
    local timeString = math.floor(seconds / 60) .. ":"
    local timeStringHelper = math.floor(seconds) % 60
    if timeStringHelper < 10 then
        timeString = timeString .. "0"
    end
    timeString = timeString .. timeStringHelper

    if showMS then
        timeString = timeString .. "."
        timeStringHelper = math.floor((seconds - math.floor(seconds)) * 100)
        if timeStringHelper < 10 then
            timeString = timeString .. "0"
        end
        timeString = timeString .. timeStringHelper
    end

    return timeString
end