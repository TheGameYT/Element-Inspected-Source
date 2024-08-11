local u = true;
local r = 0;
local shot = true;
local agent = 1
local health = 0;
local xx = 634;
local yy = 125;
local xx2 = 1000;
local yy2 = 450;
local ofs = 0;
local followchars = false;
local cambump = true;
doAngle = true;

function onUpdate()
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    end
end

function opponentNoteHit(id, direction, noteType, isSus)
    if doAngle then
        cancelTween('camAngle')
        if not mustHitSection then
            if direction == 0 then
                doTweenAngle('camAngle', 'camGame', -5, 0.75, 'quadInOut')
            elseif direction == 1 then
                doTweenAngle('camAngle', 'camGame', -2, 0.75, 'quadInOut')
            elseif direction == 2 then
                doTweenAngle('camAngle', 'camGame', 2, 0.75, 'quadInOut')
            elseif direction == 3 then
                doTweenAngle('camAngle', 'camGame', 5, 0.75, 'quadInOut')
            end
        end
    end
end

function goodNoteHit(id, direction, noteType, isSus)
    if doAngle then
        cancelTween('camAngle')
        if mustHitSection then
            if direction == 0 then
                doTweenAngle('camAngle', 'camGame', -5, 0.75, 'quadInOut')
            elseif direction == 1 then
                doTweenAngle('camAngle', 'camGame', -2, 0.75, 'quadInOut')
            elseif direction == 2 then
                doTweenAngle('camAngle', 'camGame', 2, 0.75, 'quadInOut')
            elseif direction == 3 then
                doTweenAngle('camAngle', 'camGame', 5, 0.75, 'quadInOut')
            end
        end
    end
end

function onBeatHit()
    if curBeat % 4 == 0 then
        if getProperty('dad.animation.curAnim.name') == 'idle' and getProperty('boyfriend.animation.curAnim.name') == 'idle' then
            cancelTween('camAngle')
            doTweenAngle('camAngle', 'camGame', 0, 0.75, 'quadInOut')
        end
    end
end