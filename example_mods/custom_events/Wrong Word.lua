function onEvent(name, v1, v2)
    if name == "Wrong Word" then
        cameraFlash('other', 'be331a', 0.2, true)
        setProperty('health', getProperty('health')-0.3)
        playSound('slash', 1)
    end
end