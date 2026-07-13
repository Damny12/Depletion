draw_self()

draw_set_halign(fa_center)
draw_set_valign(fa_middle)

if (place_meeting(x,oPlayer.y,oPlayer)){
	draw_text(x,y-50,"Q")
	draw_text(x,y,$"Cost:{card.cost}")
	draw_text_transformed(oPlayer.x-16,oPlayer.y-64,global.finalCoins,2,2,0)
}