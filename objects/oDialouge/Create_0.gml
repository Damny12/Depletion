revealedLetters = 0
revealedText = ""

tick = -1

function wrap(width, isLetters){
	if (isLetters){
		currentTextWidth = string_length(revealedText) - (width*string_count("\n",revealedText))
	}else{
		currentTextWidth = string_width(revealedText)
	}
	
	var spaces = []
	
	for (var i = 1; i < string_length(revealedText); i++) {
		if (string_char_at(revealedText,i) == " "){
			array_push(spaces, i)
		}
	}
	
	if (currentTextWidth >= width){
		try {
			revealedText = string_delete(revealedText,spaces[array_length(spaces)-1],1)
			revealedText = string_insert("\n",revealedText,spaces[array_length(spaces)-1])
		}
		catch (error) {
			var textDeleted = string_char_at(revealedText,string_length(revealedText))
			
			revealedText = string_delete(revealedText,string_length(revealedText),1)
			revealedText = string_insert($"\n-{textDeleted}",revealedText,string_length(revealedText))
		}
	}
}

while (string_char_at(text,revealedLetters) != "") {
	revealedLetters += 1
	revealedText += string_char_at(text,revealedLetters)
	wrap(wrapLetters,isLetters)
}

wrappedText = revealedText
revealedText = ""
revealedLetters = 0
currentWidth = 0
tick = 0