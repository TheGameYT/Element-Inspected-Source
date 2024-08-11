function onEvent(n,v1,v2)


	if n == 'Flash Cam Crimson' then

	   makeLuaSprite('flash', '', 0, 0);
        makeGraphic('flash',1280,720,'DC143C')
	      addLuaSprite('flash', true);
	      setLuaSpriteScrollFactor('flash',0,0)
	      setProperty('flash.scale.x',2)
	      setProperty('flash.scale.y',2)
	      setProperty('flash.alpha',0)
		setProperty('flash.alpha',1)
		doTweenAlpha('flTw','flash',0,v1,'linear')
	end



end