local turnvalue = 5
function opponentNoteHit()
turnvalue = 5
if curBeat % 2 == 0 then
turnvalue = -10
end



setProperty('iconP2.angle',-turnvalue)

doTweenAngle('iconTween2','iconP2',0,crochet/1000,'circOut')


end