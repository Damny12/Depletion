if (ticks == 0){
	stretchX = 2.5
	stretchY = -2.5
}

stretchX = powerTween(stretchX, 0,0.35,2)
stretchY = powerTween(stretchY, 0,0.35,2)

ticks += tickingAmount

if (abs(ticks) == 1){
	tickingAmount *= -1
}
