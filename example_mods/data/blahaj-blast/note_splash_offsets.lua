function onUpdatePost()
    for i = 0, getProperty("grpNoteSplashes.length") do
        setPropertyFromGroup("grpNoteSplashes", i, "offset.x", -30)
        setPropertyFromGroup("grpNoteSplashes", i, "offset.y", -20)
    end
end