function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dead'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'UhOh'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'GameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'GameOverEnd'); --put in mods/music/
end