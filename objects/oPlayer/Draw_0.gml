draw_sprite_ext(sprite_index,0,x,y,image_xscale+stretchX,image_yscale+stretchY,image_angle,image_blend,image_alpha)

if (drawUpgrade and !oMenu.paused){
	draw_sprite(global.cards[scroll].asset, image_index ,mouse_x,mouse_y)
	draw_text(mouse_x,mouse_y - 96, upgradeLevel)
}