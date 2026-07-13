if (place_meeting(x,oPlayer.y,oPlayer)){
	try {
		draw_text(display_get_gui_width()/2,100,global.skillDescriptions[$ card.title])
	}
	catch (error) {}
}