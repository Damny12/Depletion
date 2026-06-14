var _nine=sprite_get_nineslice(sOxygen)
_nine.enabled=true

if (!loss){
    draw_sprite_ext(sOxygen,0,view_wport[0]/8,view_hport[0]*2-32,4,-20*(oPlayer.oxygen/oPlayer.maxOxygen),0,c_white,1)
    ticks=20
}else{
    draw_sprite_ext(sOxygenLoss,0,view_wport[0]/8,view_hport[0]*2-32,4,-20*(oPlayer.oxygen/oPlayer.maxOxygen),0,c_white,1)
}

_nine=sprite_get_nineslice(sOxygenBar)
_nine.enabled=true

draw_sprite_ext(sOxygenBar,0,view_wport[0]/8,view_hport[0]*2-32,4,-20,0,c_white,1)

ticks--

if (ticks%2==0 and oPlayer.source=="Enemy" and !global.deactivateBubbles){
    instance_create_layer(oPlayer.x,oPlayer.y,"PlayerStuff",oBubble)
}

if (ticks%4==0 and oPlayer.source=="Jump" and !global.deactivateBubbles){
    instance_create_layer(oPlayer.x,oPlayer.y,"PlayerStuff",oBubble)
}

if (ticks<=0){
    loss=false
}