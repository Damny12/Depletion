draw_self()

if (place_meeting(x,y,oPlayer)){
	draw_set_valign(fa_middle)
	draw_set_halign(fa_center)
	
	draw_text(x,y-50,$"Q to talk to {name}")
}