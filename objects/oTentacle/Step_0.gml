y = powerTween(y,ogY-(64*image_yscale),ticks / 100,7)
if (!oMenu.paused){
	ticks += 1
}

if (ticks >= 110){
	y = powerTween(ogY-(64*image_yscale),ogY,(ticks - 110) / 100,7)
}