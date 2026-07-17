function load(){
	if (file_exists("save.json")){
		room_goto(Load)
	}else{
		sprite_index = sGreyButton
		self.allow_hovering = false
		draw_set_font(GUI_Font)
	}
}