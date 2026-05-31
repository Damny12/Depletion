function skillLevel(name){
	var _return = 0
	for (i = 0;i<array_length(skillSet);i++){
		if (skillSet[i]==name) {
			_return+=1
		}
	}
	return _return
}

// moving
moveDir=0
moveSpd=2
defaultMoveSpd=2

xspd=0
yspd=0

//jumping
defaultgrav=0.275
defaultjump=-5

grav=defaultgrav
defaultTermVel=6
termvel=defaultTermVel
jmpspd=defaultjump

//oxygen
oxygen=10
naturalDrain=0.003
movementDrain=0.001
enemyDrain=0.1
maxOxygen=10
drainMult=1

//enemy crap
iframes=0

//finish them
attackCooldown=30
attackDmg=1
attackDebounce=0
attackLength=20

//coins
drawCoin=false
coinFrame=0
makingCoins=false
coinCount=0
coins=0
secondDelay=1

//skills
skillSet=global.skills
attackDmg=1+skillLevel("Strength")

//poison
poisonTicks=[]
poisonDmg=1

//glide
glideToggle=false
glideGrav=defaultgrav/10
glideTerminal=defaultTermVel/2
glideSpeed=defaultMoveSpd
glideSoftCapSpeed=0.02+defaultgrav

for(var i=0;i<skillLevel("Poison");i++){
	array_push(poisonTicks,60*(i/skillLevel("Poison")))
	show_debug_message(60*(i/skillLevel("Poison")))
}

if (skillLevel("Poison")==0){
	poisonDmg=0
}else{
	poisonDmg=1
}

//currency
global.finalOxygen=floor(oxygen)