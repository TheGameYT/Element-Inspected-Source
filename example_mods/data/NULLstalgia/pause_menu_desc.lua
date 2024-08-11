function onPause()
    local desc = "NULLstalgia: A nice somg between two friends\n so many memories together\n tho they should really be careful of\n what they mess around with\n as someday it may be gone\n and will only have the memories.\nTruly Nostalgic." --USE THIS STRING TO WRITE YOUR DESCRIPTION
    makeLuaText('PauseString', desc, 500, 750, 256);
    setTextAlignment('PauseString', 'right');
    setTextSize('PauseString', 20);
    addLuaText('PauseString');
end

function onResume()
    removeLuaText('PauseString', true);
end

--script by SlightlyCreative
--ciao