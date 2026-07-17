draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_white)
draw_set_font(GUI_Font)

draw_sprite_ext(sprite_index,0,x,y,image_xscale+(stretchX*image_xscale/3),image_yscale+(stretchY*image_yscale/3),image_angle+(angle*image_xscale/3),image_blend,image_alpha)

if (hovering){
	draw_set_font(GUI_Font_Italic)
}else{
	draw_set_font(GUI_Font)
}
draw_text_transformed(x,y,button_text,font_size,font_size,0) 