
//slider background
var _nine=sprite_get_nineslice(sSlider)
_nine.enabled=true

var _width=sprite_get_width(sSlider)

draw_sprite_ext(sSlider,0,startX,y,endX/_width,image_yscale,0,c_white,1)

_nine=sprite_get_nineslice(sSlide)
_nine.enabled=true

draw_sprite_ext(sSlide,0,x,y,image_xscale,image_yscale,0,c_white,1)