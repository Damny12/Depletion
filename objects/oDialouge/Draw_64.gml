draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_set_font(Dialogue_Font)
currentWidth = 0
currentHeight = 0

if (tick != -1){
	for (var i = 1; i < string_length(revealedText); i++) {
		var width = string_width(string_char_at(revealedText,i))+8
		
		currentWidth+=width
		
		if (string_char_at(revealedText,i) == "\n"){
			currentHeight += 25
			currentWidth = 0
		}
		
		draw_text_transformed(50+currentWidth,display_get_gui_height()-320+currentHeight,string_char_at(revealedText,i),size,size,0)
	}
}
