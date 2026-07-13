if (!oMenu.paused){
	if (tick == ticksNeeded and string_char_at(wrappedText,revealedLetters) != ""){
		revealedLetters += 1
		revealedText += string_char_at(wrappedText,revealedLetters)
		tick = 0
		
		oCamera.shakePower = textPower
		oCamera.shakeValue = textValue
		
	}
	
	if (tick>=dissapearTicks){
		instance_destroy()
	}
	
	tick +=1
}