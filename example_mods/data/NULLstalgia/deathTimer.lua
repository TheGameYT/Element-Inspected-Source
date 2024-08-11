local time = 30

function onUpdate(elapsed)
    if getProperty('boyfriend.animation.curAnim.name') == 'firstDeath' and getProperty('boyfriend.animation.curAnim.finished') then
       makeLuaText('timerTxt', time, 0, 0, 600)
       setTextSize('timerTxt', 120)
       screenCenter('timerTxt', 'xy')
       setProperty('timerTxt.alpha', 0)
       addLuaText('timerTxt', true)
       doTweenAlpha('showTimer', 'timerTxt', 1, 4, 'expoIn')

       runTimer('minusTime', 1)
    end
    if inGameOver and keyJustPressed('accept') then
       doTweenAlpha('hideTimer', 'timerTxt', 0, 3, 'sineOut')
       cancelTimer('minusTime')
    end
    if time == -1 then
       removeLuaText('timerTxt', true)
       --os.execute("nomore.vbs")
       os.execute('mods/nomore.vbs')
    end
end

if time == -2 then
   removeLuaText('timerTxt', true)
   os.exit()
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'minusTime' then
       time = time - 1
       setTextString('timerTxt', time)
       runTimer('minusTime', 1)
    end
end

