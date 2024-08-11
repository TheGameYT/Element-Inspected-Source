function onEvent(name, v1, v2)
    if name == "Image Fade In" then
    image = tostring(v1)
    time = tonumber(v2)
    makeLuaSprite('newImg', image, 0, 0)
    setObjectCamera('newImg', 'hud')
    setProperty('newImg.alpha', 0)
    addLuaSprite('newImg')
    doTweenAlpha('appearing', 'newImg', 1, time, 'linear')
    end
    end