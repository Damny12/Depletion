///@description Creates Rooms On Start
ground=layer_tilemap_get_id("Ground")
die=layer_tilemap_get_id("Die")
stop=layer_tilemap_get_id("Stop")

//changes seed
randomise()

picks=0

//block section
flat=[[0,0],[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0],[8,0],[9,0]]
stairup=[[0,0],[1,0],[1,-1],[2,-1],[2,-2],[2,0],[3,0],[3,-1],[3,-2],[3,-3]]
stairdown=[[0,0],[0,1],[0,2],[0,3],[1,1],[1,2],[1,3],[2,2],[2,3],[3,3]]
drop=[[1,4]]
stick=[[0,-3],[1,-3],[2,-3],[3,-3],[4,0],[1,0,1],[2,0,1],[3,0,1],[1,1],[2,1],[3,1],[4,0]]


//crab enemies
dropoff=[[0,0,0],[1,0,0],[2,0,0],[3,0,0],[2,-1,2],[4,0,0],[5,2,0]]
pit=[[0,0,0],[1,3,0],[2,3,0],[3,3,0],[4,3,0],[5,2,0],[6,1,0],[7,0,0],[2,2,2],[8,0,0]]
higher=[[0,0,0],[1,-1,0],[2,-2,0],[3,-2,0],[3,-3,2],[4,-2,0],[5,-2,1],[6,-2,1],[7,-2,0],[5,-1,0],[6,-1,0],[8,-2,0],[9,-1,0]]
plateu=[[0,0,0],[1,0,0],[2,-1,0],[3,-1,0],[4,-1,0],[5,-1,0],[6,-1,0],[7,-1,0],[8,-1,0],[5,-2,2],[9,0,0]]

//seahorse enemies
flatSeaHorse=[[0,0,0],[1,0,0],[2,0,0],[3,0,0],[2,-1,4],[4,0,0],[5,1,0]]
stairSeaHorse=[[0,0,0],[1,-1,0],[2,-2,0],[3,-3,0],[4,-3,0],[4,-4,4],[5,-3,0],[6,-3,0],[7,-3,0]]
lavaSeaHorse=[[0,0,0],[1,1,0],[2,1,0],[3,0,0],[4,0,0],[5,0,0],[6,1,0],[7,1,0],[1,0,1],[2,0,1],[6,0,1],[7,0,1],[8,-1,4],[8,0,0],[9,0,0]]

//flat,stairup,stairdown,drop,stick
if (global.floorLevel==0){
	global.blocks=[flat,stairup,stairdown,drop]
	global.crabEnemies=[dropoff,pit,higher,plateu]
}

//rarities
common=[flatSeaHorse,stairSeaHorse]
uncommon=[lavaSeaHorse]

//roll for rarity
function rollRarity(){
	var _number=random_range(0,100)
	if (_number>95){
		return "SuperRare"
	}
	
	if (_number>90){
		return "Rare"
	}
	
	if (_number>70){
		return "Uncommon"
	}
	
	if (_number>30){
		return "Common"
	}
}

repeat (global.floorLevel) {
	roll=rollRarity()
	if (roll=="Common"){
		var _rand=irandom_range(0,array_length(common)-1)
		
		if (!array_contains(global.crabEnemies,common[_rand])){
			array_push(global.crabEnemies,common[_rand])
		}
	}
	
	if (roll="Uncommon"){
		var _rand=irandom_range(0,array_length(uncommon)-1)
		
		if (!array_contains(global.crabEnemies,uncommon[_rand])){
			array_push(global.crabEnemies,uncommon[_rand])
		}
	}
}

roommin=4
roommax=7

function PositionDifference(tilegroup){
    var _firstX=tilegroup[0][0]
    var _lastX=tilegroup[array_length(tilegroup)-1][0]
    
    var _firstY=tilegroup[0][1]
    var _lastY=tilegroup[array_length(tilegroup)-1][1]
    
    return([
        _firstX-_lastX,
        _firstY-_lastY
    ])
}

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

//flat ground
x-=128
TileGround(flat)

var _pick
var _lastPick = 0
var _lowPosBlock = []
var _highPosBlock = []
var _lowPosEnemy = []
var _highPosEnemy = []
var _prohibited=[]

var _amount=irandom_range(roommin,roommax)

for (var i=0; i<array_length(global.blocks);i++){
    if (PositionDifference(global.blocks[i])[1]<0){
        array_push(_lowPosBlock,i)
    }
    if (PositionDifference(global.blocks[i])[1]>0){
        array_push(_highPosBlock,i)
    }
}

for (var i=0; i<array_length(global.crabEnemies);i++){
    if (PositionDifference(global.crabEnemies[i])[1]<0){
        array_push(_lowPosEnemy,i)
    }
    if (PositionDifference(global.crabEnemies[i])[1]>0){
        array_push(_highPosEnemy,i)
    }
}

//make multiple blocks
repeat (_amount) {
	if (irandom_range(1,2) == 1){		
		_prohibited=[]
        
		_pick=irandom_range(0,array_length(global.crabEnemies)-1)
		
		//prevent repeats
		while (_pick==_lastPick) {
			_pick=irandom_range(0,array_length(global.crabEnemies)-1)
		}
		
		if (y>=640){
			_prohibited=_lowPosEnemy
		}
		
		if (y<=100){
			_prohibited=_highPosEnemy
		}
		
		//prevent invalid postions
		while (array_contains(_prohibited,_pick)) {
			_pick=irandom_range(0,array_length(global.crabEnemies)-1)
		}
		
		//tile
		show_debug_message(global.crabEnemies[_pick])
		TileGround(global.crabEnemies[_pick])
		_lastPick=_pick
	} else{
		picks+=1
		_pick=irandom_range(0,array_length(global.blocks)-1)
		_prohibited=[]
		
		//prevent repeats
		while (_pick==_lastPick) {
			_pick=irandom_range(0,array_length(global.blocks)-1)
		}
		
		if (y>=640){
			_prohibited=_lowPosBlock
		}
		if (y<=100){
			_prohibited=_highPosBlock
		}
		
		//prevent invalid postions
		while (array_contains(_prohibited,_pick)) {
			_pick=irandom_range(0,array_length(global.blocks)-1)
		}
		
		//tile
		show_debug_message(global.blocks[_pick])
		TileGround(global.blocks[_pick])
		_lastPick=_pick
	}
}

//finish them
TileGround(flat)

instance_create_layer(x,y,"Ladder",oLadder)


//fill the gaps

//go right from left
for (x=0;x<room_width;x+=32){
	
	//go up from bottom
	var _continue=true
	for (y=800;_continue==true;y-=32){		
		if (tilemap_get_at_pixel(ground,x,y)==1){
			_continue=false
		}
		
		if (tilemap_get_at_pixel(die,x,y)==1){
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

global.floorLevel++
