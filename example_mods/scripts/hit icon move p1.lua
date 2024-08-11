local turnvalue = 5
function goodNoteHit(id, direction, noteType, isSustainNote)

turnvalue = 5
if curBeat % 2 == 0 then
turnvalue = -10
end



setProperty('iconP1.angle',turnvalue)


doTweenAngle('iconTween1','iconP1',0,crochet/1000,'circOut')



end