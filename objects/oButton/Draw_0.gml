draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_white)
draw_self()

if (hovering){
	draw_set_font(GUI_Font_Italic)
}else{
	draw_set_font(GUI_Font)
}
draw_text_transformed(x,y,button_text,font_size,font_size,0) 