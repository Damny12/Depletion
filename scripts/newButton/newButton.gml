function newButton(buttonx,buttony,xsize,ysize,btntxt,onclick){
	var _button=instance_create_layer(buttonx,buttony,"GUI",oButton,{
		func:onclick,
		button_text:btntxt
	})
	
	_button.image_xscale=xsize
	_button.image_yscale=ysize
	
	return _button
}