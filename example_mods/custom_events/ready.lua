function onEvent(name, value1, value2)

 if name == 'ready' then

  makeLuaSprite('countdownready', 'ready',262,178)

  setObjectCamera('countdownready', 'other')

  addLuaSprite('countdownready', true)

  doTweenAlpha('readyend','countdownready',0,crochet/1000,'cubeInOut')
 end


end
