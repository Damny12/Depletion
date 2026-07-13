if (follow_player){ 
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_color(c_white)
	draw_set_font(GUI_Font)
	
	matrix_set(matrix_world, matrix_build(x,y,0,0,0,0,4,4,1))
	draw_sprite_ext(sprite_index,0,0,0,image_xscale/4,image_yscale/4,image_angle,image_blend,image_alpha)
	matrix_set(matrix_world, matrix_build_identity())
	
	if (hovering){
		draw_set_font(GUI_Font_Italic)
	}else{
		draw_set_font(GUI_Font)
	}
	
	if (room == Menu){
		draw_text_transformed(x,y,button_text,font_size,font_size,0) 
	}else{
		draw_text_transformed(x,y,button_text,font_size,font_size,0) 
	}
	
}