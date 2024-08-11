function onCreate()
    timeLeft = 10
    searchWord = 'answer 1'
    answer1 = 'answer 1'
    answer2 = 'answer 2'
    answer3 = 'answer 3'
    answer4 = 'answer 4'

    testList = {
        'answer 1',
        'answer 2',
        'answer 3',
        'answer 4',
        'answer 5'
    }

    wordList = {
        'OBSESSION',
        'YANDERE',
        'BLOOD',
        'KNIFE',
        'PEN',
        'STAB',
        'PURPLE',
        'LOVE SICK',
        'LOVE',
        'CLOSET',
        'TEA',
        'WOUND',
        'CUTTING',
        'CUT',
        'SHARP',
        'DARKNESS',
        'DEEP',
        'YURI',
        'BELOVED',
        'KISSING',
        'CRAZY',
        'INTROVERT',
        'INTEREST',
        'PERSONAL SPACE',
        'DARK',
        'EPIPHANY',
        'MONOCHROME',
        'BLOOD SHED',
        'DEAD',
        'CONFESSION',
        'WEEKEND',
        'WEAKEND',
        'FEAR',
        'HORROR',
        'MASSACRE',
        'LUST',
        'KILLING',
        'KILL',
        'KILLING SPREE',
        'EXISTENCE',
        'WRATH',
        'JUST MONIKA',
        'MONIKA'
    }


    testListLength = #(testList)
    listLength = #(wordList)


    --makeLuaSprite('paper', '', screenWidth/6, screenHeight/10)
    --makeGraphic('paper', 800, 600, 'ffffff')
    makeLuaSprite('paper', 'paper', screenWidth/6, screenHeight/10)

    makeLuaSprite('ans1', '', screenWidth/6+50, screenHeight/10+50+100)
    makeGraphic('ans1', 300, 200, '33ddee')
    makeLuaSprite('ans2', '', screenWidth/6+50+getProperty('paper.width')/2, screenHeight/10+50+100)
    makeGraphic('ans2', 300, 200, '121212')
    makeLuaSprite('ans3', '', screenWidth/6+50, screenHeight/10+50+getProperty('paper.height')/2)
    makeGraphic('ans3', 300, 200, 'bbcbbc')
    makeLuaSprite('ans4', '', screenWidth/6+50+getProperty('paper.width')/2, screenHeight/10+50+getProperty('paper.height')/2)
    makeGraphic('ans4', 300, 200, '1a2b3c')

    --makeLuaText('timer', timeLeft, 0, screenWidth/2+getProperty('paper.width')/2, screenHeight/4-50)
    makeLuaText('timer', timeLeft, 0, getProperty('paper.x')+getProperty('paper.width')/2, getProperty('paper.y')+getProperty('paper.height')/32)
    makeLuaText('search', 'Find the following Word: '..searchWord, 30*15, getProperty('paper.x')+getProperty('paper.width')/4, getProperty('paper.y')+getProperty('paper.height')/32+50)
    makeLuaText('a1', answer1, 30*9, getProperty('ans1.x')+10, getProperty('ans1.y')+getProperty('ans1.height')/3)
    makeLuaText('a2', answer2, 30*9, getProperty('ans2.x')+10, getProperty('ans2.y')+getProperty('ans2.height')/3)
    makeLuaText('a3', answer3, 30*9, getProperty('ans3.x')+10, getProperty('ans3.y')+getProperty('ans3.height')/3)
    makeLuaText('a4', answer4, 30*9, getProperty('ans4.x')+10, getProperty('ans4.y')+getProperty('ans4.height')/3)

    setTextSize('timer', 40)
    setTextSize('a1', 30)
    setTextSize('a2', 30)
    setTextSize('a3', 30)
    setTextSize('a4', 30)
    setTextSize('search', 30)

    setTextAlignment('timer', 'center')
    setTextAlignment('a1', 'center')
    setTextAlignment('a2', 'center')
    setTextAlignment('a3', 'center')
    setTextAlignment('a4', 'center')
    setTextAlignment('search', 'center')

    setObjectCamera('timer', 'other')
    setObjectCamera('paper', 'other')
    setObjectCamera('ans1', 'other')
    setObjectCamera('ans2', 'other')
    setObjectCamera('ans3', 'other')
    setObjectCamera('ans4', 'other')
    setObjectCamera('a1', 'other')
    setObjectCamera('a2', 'other')
    setObjectCamera('a3', 'other')
    setObjectCamera('a4', 'other')
    setObjectCamera('search', 'other')

    doTweenColor('poembg','paper','dddddd', 0.1, 'linear')
    setTextColor('search', 'be331a')

    doTweenAlpha('win', 'paper', 0, 0.1, 'linear')
    doTweenAlpha('time', 'timer', 0, 0.1, 'linear')
    doTweenAlpha('ans1a', 'ans1', 0, 0.1, 'linear')
    doTweenAlpha('ans2a', 'ans2', 0, 0.1, 'linear')
    doTweenAlpha('ans3a', 'ans3', 0, 0.1, 'linear')
    doTweenAlpha('ans4a', 'ans4', 0, 0.1, 'linear')
    doTweenAlpha('a1a', 'a1', 0, 0.1, 'linear')
    doTweenAlpha('a2a', 'a2', 0, 0.1, 'linear')
    doTweenAlpha('a3a', 'a3', 0, 0.1, 'linear')
    doTweenAlpha('a4a', 'a4', 0, 0.1, 'linear')
    doTweenAlpha('daword', 'search', 0, 0.1, 'linear')

    --scaleObject('ans1', 0.9,0.9)
    --scaleObject('ans2', 0.8,0.8)
    --scaleObject('ans3', 0.7,0.7)
    --scaleObject('ans4', 0.6,0.6)

    doTweenY('ans1y', 'ans1.scale', 0.45, 0.1, 'linear')
    doTweenY('ans2y', 'ans2.scale', 0.45, 0.1, 'linear')
    doTweenY('ans3y', 'ans3.scale', 0.45, 0.1, 'linear')
    doTweenY('ans4y', 'ans4.scale', 0.45, 0.1, 'linear')

    doTweenX('ans1x', 'ans1.scale', 0.9, 0.1, 'linear')
    doTweenX('ans2x', 'ans2.scale', 0.9, 0.1, 'linear')
    doTweenX('ans3x', 'ans3.scale', 0.9, 0.1, 'linear')
    doTweenX('ans4x', 'ans4.scale', 0.9, 0.1, 'linear')


    addLuaSprite('paper')
    addLuaText('timer')
    addLuaSprite('ans1')
    addLuaSprite('ans2')
    addLuaSprite('ans3')
    addLuaSprite('ans4')
    addLuaText('a1')
    addLuaText('a2')
    addLuaText('a3')
    addLuaText('a4')
    addLuaText('search')
    


    --custom cursor
    --runHaxeCode([[
	    --FlxG.mouse.unload();
	    --FlxG.log.add("Sexy mouse cursor " + Paths.image("doki_curse"));// amogusgameALT i'm looking at you 
	    --FlxG.mouse.load(Paths.image("doki_curse").bitmap, 1.5, 0);// you can't hide what you did
	--]])

    isWriting = false



end

function onEvent(name, value1, value2)
    if name == 'write-poem' then
        if value1 == '' then
            searchWord = tostring(wordList[getRandomInt(1, listLength)])
        else
            searchWord = tostring(value1)
        end

        if value2 == '' then
            timeLeft = 5 --og 10
        else
            timeLeft = tonumber(value2)
        end

        if isWriting then
            poemOff()
        end

        setTextString('search', 'Find the following Word: '..searchWord)
        --debugPrint('search for: ', searchWord)


        ans = math.random(1,4)
        if ans == 1 then
            answer1 = searchWord
	
            answer2 = tostring(wordList[getRandomInt(1, listLength)])	
            answer3 = tostring(wordList[getRandomInt(1, listLength)])	
            answer4 = tostring(wordList[getRandomInt(1, listLength)])	
            answer5 = tostring(wordList[getRandomInt(1, listLength)])	
            answer6 = tostring(wordList[getRandomInt(1, listLength)])

            if answer2 == searchWord then
                answer2 = tostring(wordList[getRandomInt(1, listLength)])
            end
            if answer3 == searchWord then
                answer3 = tostring(wordList[getRandomInt(1, listLength)])
            end
            if answer4 == searchWord then
                answer4 = tostring(wordList[getRandomInt(1, listLength)])
            end
            if answer5 == searchWord then
                answer5 = tostring(wordList[getRandomInt(1, listLength)])
            end
            if answer6 == searchWord then
                answer6 = tostring(wordList[getRandomInt(1, listLength)])
            end

        elseif ans == 2 then
            answer2 = searchWord

            answer1 = tostring(wordList[getRandomInt(1, listLength)])	
            answer3 = tostring(wordList[getRandomInt(1, listLength)])	
            answer4 = tostring(wordList[getRandomInt(1, listLength)])	
            answer5 = tostring(wordList[getRandomInt(1, listLength)])	
            answer6 = tostring(wordList[getRandomInt(1, listLength)])

            if answer1 == searchWord then
                answer1 = tostring(wordList[getRandomInt(1, listLength)])
            end
            if answer3 == searchWord then
                answer3 = tostring(wordList[getRandomInt(1, listLength)])
            end
            if answer4 == searchWord then
                answer4 = tostring(wordList[getRandomInt(1, listLength)])
            end
            if answer5 == searchWord then
                answer5 = tostring(wordList[getRandomInt(1, listLength)])
            end
            if answer6 == searchWord then
                answer6 = tostring(wordList[getRandomInt(1, listLength)])
            end
        elseif ans == 3 then
            answer3 = searchWord

            answer1 = tostring(wordList[getRandomInt(1, listLength)])	
            answer2 = tostring(wordList[getRandomInt(1, listLength)])	
            answer4 = tostring(wordList[getRandomInt(1, listLength)])	
            answer5 = tostring(wordList[getRandomInt(1, listLength)])	
            answer6 = tostring(wordList[getRandomInt(1, listLength)])

            if answer1 == searchWord then
                answer1 = tostring(wordList[getRandomInt(1, listLength)])
            end
            if answer2 == searchWord then
                answer2 = tostring(wordList[getRandomInt(1, listLength)])
            end
            if answer4 == searchWord then
                answer4 = tostring(wordList[getRandomInt(1, listLength)])
            end
            if answer5 == searchWord then
                answer5 = tostring(wordList[getRandomInt(1, listLength)])
            end
            if answer6 == searchWord then
                answer6 = tostring(wordList[getRandomInt(1, listLength)])
            end
        elseif ans == 4 then
            answer4 = searchWord

            answer1 = tostring(wordList[getRandomInt(1, listLength)])	
            answer2 = tostring(wordList[getRandomInt(1, listLength)])	
            answer3 = tostring(wordList[getRandomInt(1, listLength)])	
            answer5 = tostring(wordList[getRandomInt(1, listLength)])	
            answer6 = tostring(wordList[getRandomInt(1, listLength)])

            if answer1 == searchWord then
                answer1 = tostring(wordList[getRandomInt(1, listLength)])
            end
            if answer2 == searchWord then
                answer2 = tostring(wordList[getRandomInt(1, listLength)])
            end
            if answer3 == searchWord then
                answer3 = tostring(wordList[getRandomInt(1, listLength)])
            end
            if answer5 == searchWord then
                answer5 = tostring(wordList[getRandomInt(1, listLength)])
            end
            if answer6 == searchWord then
                answer6 = tostring(wordList[getRandomInt(1, listLength)])
            end
        elseif ans == 5 then
            answer5 = searchWord

            answer1 = tostring(wordList[getRandomInt(1, listLength)])	
            answer2 = tostring(wordList[getRandomInt(1, listLength)])	
            answer3 = tostring(wordList[getRandomInt(1, listLength)])	
            answer4 = tostring(wordList[getRandomInt(1, listLength)])	
            answer6 = tostring(wordList[getRandomInt(1, listLength)])

            if answer1 == searchWord then
                answer1 = tostring(wordList[getRandomInt(1, listLength)])
            end
            if answer2 == searchWord then
                answer2 = tostring(wordList[getRandomInt(1, listLength)])
            end
            if answer3 == searchWord then
                answer3 = tostring(wordList[getRandomInt(1, listLength)])
            end
            if answer4 == searchWord then
                answer4 = tostring(wordList[getRandomInt(1, listLength)])
            end
            if answer6 == searchWord then
                answer6 = tostring(wordList[getRandomInt(1, listLength)])
            end
        elseif ans == 6 then
            answer6 = searchWord

            answer1 = tostring(wordList[getRandomInt(1, listLength)])	
            answer2 = tostring(wordList[getRandomInt(1, listLength)])	
            answer3 = tostring(wordList[getRandomInt(1, listLength)])	
            answer4 = tostring(wordList[getRandomInt(1, listLength)])	
            answer5 = tostring(wordList[getRandomInt(1, listLength)])

            if answer1 == searchWord then
                answer1 = tostring(wordList[getRandomInt(1, listLength)])
            end
            if answer2 == searchWord then
                answer2 = tostring(wordList[getRandomInt(1, listLength)])
            end
            if answer3 == searchWord then
                answer3 = tostring(wordList[getRandomInt(1, listLength)])
            end
            if answer4 == searchWord then
                answer4 = tostring(wordList[getRandomInt(1, listLength)])
            end
            if answer5 == searchWord then
                answer5 = tostring(wordList[getRandomInt(1, listLength)])
            end
        end
        setTextString('a1', answer1)
        setTextString('a2', answer2)
        setTextString('a3', answer3)
        setTextString('a4', answer4)
        setTextString('a5', answer5)
        setTextString('a6', answer6)
        --this below overrides whoever the top one is
        setTextString('a'..ans, searchWord)
	




        runTimer('panic', 1, timeLeft)

        setProperty('boyfriend.stunned', true);

        doTweenAlpha('win', 'paper', 1, 0.1, 'linear')
        doTweenAlpha('time', 'timer', 1, 0.1, 'linear')
        --doTweenAlpha('ans1a', 'ans1', 1, 0.1, 'linear')
        --doTweenAlpha('ans2a', 'ans2', 1, 0.1, 'linear')
        --doTweenAlpha('ans3a', 'ans3', 1, 0.1, 'linear')
        --doTweenAlpha('ans4a', 'ans4', 1, 0.1, 'linear')
        doTweenAlpha('a1a', 'a1', 1, 0.1, 'linear')
        doTweenAlpha('a2a', 'a2', 1, 0.1, 'linear')
        doTweenAlpha('a3a', 'a3', 1, 0.1, 'linear')
        doTweenAlpha('a4a', 'a4', 1, 0.1, 'linear')
        doTweenAlpha('daword', 'search', 1, 0.1, 'linear')



        --custom cursor
        --doki_curse is no poem_pointer
        runHaxeCode([[
		    FlxG.mouse.unload();
		    FlxG.log.add("Sexy mouse cursor " + Paths.image("poem_pointer"));// amogusgameALT i'm looking at you 
		    FlxG.mouse.load(Paths.image("poem_pointer").bitmap, 1, 0);// you can't hide what you did
	    ]])
        --mouse.load(graphic,scale,xoffset,yoffset)

        setPropertyFromClass('flixel.FlxG', 'mouse.visible', true);

        isWriting = true

    end
end

function onUpdate()
    getMouseX('hud')
    getMouseY('hud')

    setTextString('timer', timeLeft)

    if isWriting then
        setProperty('canPause', false)
    else
        setProperty('canPause', true)
    end

    if isWriting and keyJustPressed('PAUSE') then
        if getProperty('canPause') == false then
            stopSound('nono')
            playSound('noHeal', 0.5, 'nono')
        end
    end

    if isWriting and mouseClicked() then
        --answer 1 hitbox check
        if getMouseX() >= getProperty('ans1.x') and getMouseX() <= getProperty('ans1.x') + getProperty('ans1.width') and getMouseY() >= getProperty('ans1.y') and getMouseY() <= getProperty('ans1.y') + getProperty('ans1.height') then
            if answer1 == searchWord then
                --debugPrint('Correct Answer!')
                cancelTimer('panic')
                --playSound('heal', 1)
                setProperty('boyfriend.stunned', false);

                doTweenAlpha('win', 'paper', 0, 0.1, 'linear')
                doTweenAlpha('time', 'timer', 0, 0.1, 'linear')
                --doTweenAlpha('ans1a', 'ans1', 0, 0.1, 'linear')
                --doTweenAlpha('ans2a', 'ans2', 0, 0.1, 'linear')
                --doTweenAlpha('ans3a', 'ans3', 0, 0.1, 'linear')
                --doTweenAlpha('ans4a', 'ans4', 0, 0.1, 'linear')
                doTweenAlpha('a1a', 'a1', 0, 0.1, 'linear')
                doTweenAlpha('a2a', 'a2', 0, 0.1, 'linear')
                doTweenAlpha('a3a', 'a3', 0, 0.1, 'linear')
                doTweenAlpha('a4a', 'a4', 0, 0.1, 'linear')
                doTweenAlpha('daword', 'search', 0, 0.1, 'linear')

                setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
                runHaxeCode('FlxG.mouse.unload();')
                isWriting = false
            else
                stopSound('wrong')
                --playSound('noHeal', 0.5, 'wrong')
                --debugPrint('Wrong Answer!')

                cancelTimer('panic')
                poemOff()
            end
        elseif getMouseX() >= getProperty('ans2.x') and getMouseX() <= getProperty('ans2.x') + getProperty('ans2.width') and getMouseY() >= getProperty('ans2.y') and getMouseY() <= getProperty('ans2.y') + getProperty('ans2.height') then
            if answer2 == searchWord then
                --debugPrint('Correct Answer!')
                cancelTimer('panic')
                --playSound('heal', 1)
                setProperty('boyfriend.stunned', false);

                doTweenAlpha('win', 'paper', 0, 0.1, 'linear')
                doTweenAlpha('time', 'timer', 0, 0.1, 'linear')
                --doTweenAlpha('ans1a', 'ans1', 0, 0.1, 'linear')
                --doTweenAlpha('ans2a', 'ans2', 0, 0.1, 'linear')
                --doTweenAlpha('ans3a', 'ans3', 0, 0.1, 'linear')
                --doTweenAlpha('ans4a', 'ans4', 0, 0.1, 'linear')
                doTweenAlpha('a1a', 'a1', 0, 0.1, 'linear')
                doTweenAlpha('a2a', 'a2', 0, 0.1, 'linear')
                doTweenAlpha('a3a', 'a3', 0, 0.1, 'linear')
                doTweenAlpha('a4a', 'a4', 0, 0.1, 'linear')
                doTweenAlpha('daword', 'search', 0, 0.1, 'linear')

                setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
                runHaxeCode('FlxG.mouse.unload();')
                isWriting = false
            else
                stopSound('wrong')
                --playSound('noHeal', 0.5, 'wrong')
                --debugPrint('Wrong Answer!')

                cancelTimer('panic')
                poemOff()
            end
        elseif getMouseX() >= getProperty('ans3.x') and getMouseX() <= getProperty('ans3.x') + getProperty('ans3.width') and getMouseY() >= getProperty('ans3.y') and getMouseY() <= getProperty('ans3.y') + getProperty('ans3.height') then
            if answer3 == searchWord then
                --debugPrint('Correct Answer!')
                cancelTimer('panic')
                --playSound('heal', 1)
                setProperty('boyfriend.stunned', false);

                doTweenAlpha('win', 'paper', 0, 0.1, 'linear')
                doTweenAlpha('time', 'timer', 0, 0.1, 'linear')
                --doTweenAlpha('ans1a', 'ans1', 0, 0.1, 'linear')
                --doTweenAlpha('ans2a', 'ans2', 0, 0.1, 'linear')
                --doTweenAlpha('ans3a', 'ans3', 0, 0.1, 'linear')
                --doTweenAlpha('ans4a', 'ans4', 0, 0.1, 'linear')
                doTweenAlpha('a1a', 'a1', 0, 0.1, 'linear')
                doTweenAlpha('a2a', 'a2', 0, 0.1, 'linear')
                doTweenAlpha('a3a', 'a3', 0, 0.1, 'linear')
                doTweenAlpha('a4a', 'a4', 0, 0.1, 'linear')
                doTweenAlpha('daword', 'search', 0, 0.1, 'linear')

                setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
                runHaxeCode('FlxG.mouse.unload();')
                isWriting = false
            else
                stopSound('wrong')
                --playSound('noHeal', 0.5, 'wrong')
                --debugPrint('Wrong Answer!')

                cancelTimer('panic')
                poemOff()
            end
        elseif getMouseX() >= getProperty('ans4.x') and getMouseX() <= getProperty('ans4.x') + getProperty('ans4.width') and getMouseY() >= getProperty('ans4.y') and getMouseY() <= getProperty('ans4.y') + getProperty('ans4.height') then
            if answer4 == searchWord then
                --debugPrint('Correct Answer!')
                cancelTimer('panic')
                --playSound('heal', 1)
                setProperty('boyfriend.stunned', false);

                doTweenAlpha('win', 'paper', 0, 0.1, 'linear')
                doTweenAlpha('time', 'timer', 0, 0.1, 'linear')
                --doTweenAlpha('ans1a', 'ans1', 0, 0.1, 'linear')
                --doTweenAlpha('ans2a', 'ans2', 0, 0.1, 'linear')
                --doTweenAlpha('ans3a', 'ans3', 0, 0.1, 'linear')
                --doTweenAlpha('ans4a', 'ans4', 0, 0.1, 'linear')
                doTweenAlpha('a1a', 'a1', 0, 0.1, 'linear')
                doTweenAlpha('a2a', 'a2', 0, 0.1, 'linear')
                doTweenAlpha('a3a', 'a3', 0, 0.1, 'linear')
                doTweenAlpha('a4a', 'a4', 0, 0.1, 'linear')
                doTweenAlpha('daword', 'search', 0, 0.1, 'linear')

                setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
                runHaxeCode('FlxG.mouse.unload();')
                isWriting = false
            else
                stopSound('wrong')
                --playSound('noHeal', 0.5, 'wrong')
                --debugPrint('Wrong Answer!')

                poemOff()
                cancelTimer('panic')
            end
        else
            stopSound('wrong')
            --playSound('noHeal', 0.5, 'wrong')
            --debugPrint('No hitbox hit')
        end
    end
end

function onTimerCompleted(tag, loops, loopsleft)
    if tag == 'panic' then
        if loopsleft == 0 then
            poemOff()
        end
            timeLeft = timeLeft - 1
            --setTextString('timer', timeLeft)
    end
end

function onDestroy()
    runHaxeCode('FlxG.mouse.unload();')
    setProperty('boyfriend.stunned', false);
    cancelTimer('panic')
end

function onEndSong()
    runHaxeCode('FlxG.mouse.unload();')
    setProperty('boyfriend.stunned', false);
    cancelTimer('panic')
end

function poemOff()
    setProperty('health', getProperty('health')-0.3)
    playSound('slash', 1)

    doTweenAlpha('win', 'paper', 0, 0.1, 'linear')
    doTweenAlpha('time', 'timer', 0, 0.1, 'linear')
    doTweenAlpha('a1a', 'a1', 0, 0.1, 'linear')
    doTweenAlpha('a2a', 'a2', 0, 0.1, 'linear')
    doTweenAlpha('a3a', 'a3', 0, 0.1, 'linear')
    doTweenAlpha('a4a', 'a4', 0, 0.1, 'linear')
    doTweenAlpha('daword', 'search', 0, 0.1, 'linear')

    cameraFlash('other', 'be331a', 0.5, true)

    setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
    runHaxeCode('FlxG.mouse.unload();')

    setProperty('boyfriend.stunned', false);
    triggerEvent('Wrong Word')

    isWriting = false
end