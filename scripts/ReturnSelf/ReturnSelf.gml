function ReturnSelf(){
	return self
}

function ReturnLayer(){
	return self.layer
}

function ReturnDepth(){
	return self.depth
}

function ReturnID(){
	return self.id
}

function ReturnPos(){
	return [self.x,self.y]
}

function ReturnScale(){
	return [self.image_xscale,self.image_yscale]
}

function ReturnAsset(){
	return self.object_index
}