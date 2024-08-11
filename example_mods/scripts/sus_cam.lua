function onCreatePost()
	setObjectOrder('notes',getObjectOrder('timeTxt'))--Change the arrow behind the arrow layer
end
function onSpawnNote(id,direction,noteType,isSustainNote)--Triggered when an arrow is generated
	if not isSustainNote then
		setObjectOrder('notes.members['..id..']',getObjectOrder('healthBarBG')-1)--Change the not sus note back to the original layer
		setObjectCamera('notes.members['..id..']','camHUD')--Because the above modification causes one more copy of the modified map, we will put the one more copy in camHUD
	end
end
--无敌的黑化HEIHUA编写