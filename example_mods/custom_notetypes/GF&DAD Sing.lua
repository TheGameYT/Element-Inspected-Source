function goodNoteHit(id, noteData, noteType, isSustainNote)

    if noteType == 'GF&DAD Sing' then

        local animToPlay = getProperty('singAnimations')[noteData + 1];

        playAnim('Gf', animToPlay, true);

        playAnim('dad', animToPlay, true);

    end

end