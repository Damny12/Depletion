ground=layer_tilemap_get_id("Ground")
die=layer_tilemap_get_id("Die")
stop=layer_tilemap_get_id("Stop")

function TileGround(tiles){
	//tile
	var _startX=x
	var _startY=y
	for (i=0;i<array_length(tiles);i++){
		enemy=0
		tile=tiles[i]
		x=_startX
		y=_startY
		for (position=0;position<array_length(tile);position++){			
			if (position==0){
				x+=tile[position]*32
			}
			
			if (position==1){
				y+=tile[position]*32
			}
			
			if(position==2){
				enemy=tile[position]
			}
		}
		
		//make tile
		if (enemy==-1) {
			tilemap_set_at_pixel(ground,3,x,y)
		}
		
		if (enemy==0) {
			tilemap_set_at_pixel(ground,1,x,y)
		}
		
		if (enemy==1) {
			tilemap_set_at_pixel(die,2,x,y)
		}
		
		if (enemy>=2) {
			y+=32
			instance_create_layer(x,y,"Enemy",global.enemies[enemy-2])
		}
	}
}

var _file = file_text_open_read("save.json")

text = file_text_read_string(_file)
save = json_parse(text)

function setGlobal(name,value){
	try {
		if (name != "persistentGlobal") {
			return
		}
		global[$ name] = value
	}
	catch (error) {
		show_debug_message(error)
	}
}

struct_foreach(save.gameVariables,setGlobal)

instance_create_layer(656,352,"PlayerStuff",oPlayer,{
	image_xscale:2,
	image_yscale:2
})
x-=128

for (var i = 0; i < array_length(save.room); i++) {
	TileGround(save.room[i])
}

instance_create_layer(x,y,"Ladder",oLadder)

for (x=0;x<room_width;x+=32){
	
	//go up from bottom
	var _continue=true
	for (y=864;_continue==true;y-=32){		
		if (tilemap_get_at_pixel(ground,x,y)==1 or tilemap_get_at_pixel(ground,x,y)==3){
			_continue=false
		}
		
		if (tilemap_get_at_pixel(die,x,y)==2){
			_continue=false
		}
		
		if (y==0){
			_continue=false
		}
		
		if (tilemap_get_at_pixel(ground,x,y)==0 and _continue==true){
			tilemap_set_at_pixel(ground,1,x,y)
		}
	}
}