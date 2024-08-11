function noteMiss(id, noteData, noteType, isSus)
    if isSus then
        setProperty("songMisses", getProperty("songMisses") - 1)
    end
end