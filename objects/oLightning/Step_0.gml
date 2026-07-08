tick--
if (tick <= 0){
	if (create_flash){
		instance_create_depth(x,y,-10000,oLightning, {
			sprite_index:sFlash,
			image_xscale:100,
			image_yscale:100,
			create_flash:false,
			starting_tick:50
		})
	}
	instance_destroy()
}