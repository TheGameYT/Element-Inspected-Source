-- Me when we have now settings :)
local pref = {
    LinkIcons = false,   --Links icons to healthBar sides
    OppoAngle = 0,       --Angle to rotate on bop (Opponent)
    PlayerAngle = 0,     --Angle to rotate on bop (Player)
    Duration = 0.5,      --Duration of rotation bop
    OppoScale = 1.15,    --Scale icon on bop (Opponent)
    PlayerScale = 1.15,  --Scale icon on bop (Player)
    ScaleDuration = 0.25, --Duration of scale
	MoveDuration = 0.25,  --Duration for Icon moving
    Easing = 'backOut',  --Easing of Booping
    HideIcons = false    --Hides le icons
}
-- Code Block --
function onUpdatePost()	
    if (pref.LinkIcons) then
        setProperty('game.iconP1.x', getMidpointX('game.healthBar') + 224)
        setProperty('game.iconP2.x', getMidpointX('game.healthBar') - 374)
        setProperty('game.iconP1.y', getMidpointY('game.healthBar') - 75)
        setProperty('game.iconP2.y', getMidpointY('game.healthBar') - 75)
    end
	
    if (pref.HideIcons) then
        setProperty('game.iconP1.visible', false)
        setProperty('game.iconP2.visible', false)
    end
end

function onBeatHit()
        setProperty('iconP2.angle', pref.OppoAngle);
        doTweenAngle('bip', 'iconP2', 0, pref.Duration, pref.Easing);
        scaleObject('iconP2', pref.OppoScale, pref.Duration, true)
        doTweenX('bipX', 'iconP2.scale', 1, pref.ScaleDuration, pref.Easing)
        doTweenY('bipY', 'iconP2.scale', 1, pref.ScaleDuration, pref.Easing)
		doTweenX('bipX2', 'iconP2', 0, pref.MoveDuration, pref.Easing);

        setProperty('iconP1.angle', -pref.PlayerAngle);
        doTweenAngle('bop', 'iconP1', 0, pref.Duration, pref.Easing);
        scaleObject('iconP1', pref.PlayerScale, pref.Duration, true)
        doTweenX('bopX', 'iconP1.scale', 1, pref.ScaleDuration, pref.Easing)
        doTweenY('bopY', 'iconP1.scale', 1, pref.ScaleDuration, pref.Easing)
		doTweenX('bopX2', 'iconP1', 0, pref.MoveDuration, pref.Easing);
		
    if curBeat % 2 == 0 then
        setProperty('iconP2.angle', -pref.OppoAngle);
        doTweenAngle('bip', 'iconP2', 0, pref.Duration, pref.Easing);
        setProperty('iconP1.angle', pref.PlayerAngle);
        doTweenAngle('bop', 'iconP1', 0, pref.Duration, pref.Easing);
    end
    updateHitbox('iconP1')
    updateHitbox('iconP2')
end
