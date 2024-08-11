--Settings --
local pref = {
    Font = 'LilitaOne-Regular.ttf', --Sets font here
    GlobalY = 575,	--GlobalY for judgement counters
	Size = 20,	--Size for judgement Counters
	GlobalX = 30, --GlobalX for judgement counters
	PulseColor = true --Pulse when you hit notes?
}

function onCreatePost()
    makeLuaText('sicksTxt', 'Sicks: ', 0, -115, 350)
    setTextSize('sicksTxt', pref.Size)
    setProperty('sicksTxt.y', pref.GlobalY)
    setTextBorder('sicksTxt', 2, '000000')

    makeLuaText('goodsTxt', 'Goods: ', 0, -115, 200)
    setTextSize('goodsTxt', pref.Size)
    setProperty('goodsTxt.y', pref.GlobalY + 25)
    setTextBorder('goodsTxt', 2, '000000')

    makeLuaText('badsTxt', 'Bads: ', 0, -115, 200)
    setTextSize('badsTxt', pref.Size)
    setProperty('badsTxt.y', pref.GlobalY + 50)
    setTextBorder('badsTxt', 2, '000000')

    makeLuaText('shitsTxt', 'Shits: ', 0, -115, 200)
    setTextSize('shitsTxt', pref.Size)
    setProperty('shitsTxt.y', pref.GlobalY + 75)
    setTextBorder('shitsTxt', 2, '000000')

    makeLuaText('comboTxt', 'Combo: ', 0, -115, 200)
    setTextSize('comboTxt', pref.Size)
    setProperty('comboTxt.y', pref.GlobalY + 100)
    setTextBorder('comboTxt', 2, '000000')

    setTextFont('sicksTxt', pref.Font .. '.ttf')
    setTextFont('goodsTxt', pref.Font .. '.ttf')
    setTextFont('badsTxt', pref.Font .. '.ttf')
    setTextFont('shitsTxt', pref.Font .. '.ttf')
    setTextFont('comboTxt', pref.Font .. '.ttf')

    addLuaText('sicksTxt')
    addLuaText('goodsTxt')
    addLuaText('badsTxt')
    addLuaText('shitsTxt')
    addLuaText('comboTxt')
end

function onUpdatePost()
    setTextString('sicksTxt', 'Sicks: ' .. getProperty('ratingsData[0].hits'))
    setTextString('goodsTxt', 'Goods: ' .. getProperty('ratingsData[1].hits'))
    setTextString('badsTxt', 'Bads: ' .. getProperty('ratingsData[2].hits'))
    setTextString('shitsTxt', 'Shits: ' .. getProperty('ratingsData[3].hits'))
    setTextString('comboTxt', 'Combo: ' .. getProperty('combo'))
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if not isSustainNote and pref.PulseColor == true then
        setProperty('comboTxt.color', 0x00FF00)
        doTweenColor('comboColorChange', 'comboTxt', 'FFFFFF', 0.3, 'linear')

        local noteRating = getPropertyFromGroup('notes', id, 'rating')
        setProperty(noteRating..'sTxt.color', 0x00FF00)
        doTweenColor(noteRating..'ColorChange', noteRating..'sTxt', 'FFFFFF', 0.3, 'linear')
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
    if not isSustainNote then
        setProperty('comboTxt.color', 0xFF0000)
        doTweenColor('comboColorChange', 'comboTxt', 'FFFFFF', 0.3, 'linear')
    end
end

function onSongStart()
    doTweenX('sicksTxtComeHere', 'sicksTxt', pref.GlobalX, 0.5, 'backOut')
    doTweenX('goodsTxtComeHere', 'goodsTxt', pref.GlobalX, 0.6, 'backOut')
    doTweenX('badsTxtComeHere', 'badsTxt', pref.GlobalX, 0.7, 'backOut')
    doTweenX('shitsTxtComeHere', 'shitsTxt', pref.GlobalX, 0.8, 'backOut')
    doTweenX('comboTxtComeHere', 'comboTxt', pref.GlobalX, 0.9, 'backOut')
end
