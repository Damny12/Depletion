function play(){
	if (global.tutorial){
		room_goto(Tutorial)
	}else{
		room_goto(Levels)
	}
}