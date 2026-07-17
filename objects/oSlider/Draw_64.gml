
//slider background
var _nine=sprite_get_nineslice(sSlider)
_nine.enabled=true

var _width=sprite_get_width(sSlider)

if (!instance_exists(oPlayer)){
	matrix_set(matrix_world, matrix_build(startX,y,0,0,0,0,4,4,1))
	draw_sprite_ext(sSlider,0,0,0,(endX/_width)/4,image_yscale/4,image_angle,c_white,1)
	matrix_set(matrix_world, matrix_build_identity())
}else{
	draw_sprite_ext(sSlider,0,startX,y,endX/_width,image_yscale,image_angle,c_white,1)
}

_nine=sprite_get_nineslice(sSlide)
_nine.enabled=true

if (!instance_exists(oPlayer)){
	matrix_set(matrix_world, matrix_build(x,y,0,0,0,0,4,4,1))
	draw_sprite_ext(sSlide,0,0,0,image_xscale/4+stretchX,image_yscale/4+stretchY,image_angle+angle,c_white,1)
	matrix_set(matrix_world, matrix_build_identity())
}else{
	draw_sprite_ext(sSlide,0,x,y,image_xscale+stretchX,image_yscale+stretchY,image_angle+angle,c_white,1)
}