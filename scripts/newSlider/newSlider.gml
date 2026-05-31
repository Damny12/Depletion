function newSlider(xMin,xMax,minValue,maxValue){
	var _slider=instance_create_layer(x,y,"GUI",oSlider,{
		minVal:minValue,
		maxVal:maxValue,
		minX:xMin,
		maxX:xMax
	})
	return _slider
}