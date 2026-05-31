x+=xspd
y+=yspd

//relative to charecter
var _refrencex=oSlime.x-x
var _refrencey=oSlime.y-y

if (_refrencex>=320-thresholdX) {
	xspd+=1
}else{
	xspd-=1
}

if (_refrencex<=-320+thresholdX) {
	xspd-=1
}else{
	xspd+=1
}

if (_refrencey>=180-thresholdY) {
	yspd+=1
}else{
	yspd-=1
}

if (_refrencey<=-180+thresholdY) {
	yspd-=1
}else{
	yspd+=1
}

xspd-=xspd*dragX
yspd-=yspd*dragY