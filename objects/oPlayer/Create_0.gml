// moving
moveDir=0
moveSpd=0.4
defaultMoveSpd=0.4

xspd=0
yspd=0

defaultXTermvel=3
xFriction=1.1
xTermvel=3

prevDir=0

//ticking
ticks=0
knockbackTicks=0

//jumping
defaultgrav=0.275
defaultjump=-5
inAir=false

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
drainMult=1/root(count(global.skills,"Breathing")+1,4)

source=""
drainIncrease=count(global.modifiers,GrowingPressure)*0.04

//enemy stuff
iframes=0
lavaTick=1

//attacking
attackCooldown=30
attackDmg=1
attackDebounce=0
attackLength=20
attackObject=noone
attackWeapon=global.weapon

knockbackMoveSpd=0

//coins
coinFrame=0
makingCoins=false
coinCount=0
coins=0
secondDelay=1
lastCollect=false
totalCoins=0

//skills
attackDmg=1+count(global.skills,"Strength")

knockbackMult=1+sqrt(count(global.skills,"Knockback"))/4

//poison
poisonTicks=[]
poisonDmg=1

//glide
glideToggle=false
glideGrav=defaultgrav/10
glideTerminal=defaultTermVel/2
glideSpeed=defaultMoveSpd*(1+count(global.skills,"Glide")/8)
glideSoftCapSpeed=0.02+defaultgrav

//stretching
stretchY = 0
stretchX = 0

//poison timing
for(var i=0;i<count(global.skills,"Poison");i++){
	array_push(poisonTicks,60*(round(i/count(global.skills,"Poison")*10))/10)
}

if (count(global.skills,"Poison")==0){
	poisonDmg=0
}else{
	poisonDmg=1
}

//set weapon
if (count(global.skills,"Bow")==1){
	array_delete(global.skills,array_get_index(global.skills,"Bow"),1)
	global.weapon=oArrow
	attackWeapon=global.weapon
}

if (count(global.skills,"Sword")==1){
	array_delete(global.skills,array_get_index(global.skills,"Sword"),1)
	global.weapon=oAttack
	attackWeapon=global.weapon
}

if (count(global.skills,"Hammer")==1){ 
	array_delete(global.skills,array_get_index(global.skills,"Sword"),1)
	global.weapon=oHammer
	attackWeapon=global.weapon
}

if (global.weapon == oHammer){
	attackDmg*=1.5
	attackDmg=floor(attackDmg)
	hammerOxygen=[]
	
	var fractionEquation = 11+count(global.skills,"Breathing") //want to be able to attack 10 times, so make the number 11
	var _hammerOxygenIncrement=maxOxygen/(fractionEquation)
	
	for (var i=0;i<fractionEquation;i++){
		array_push(hammerOxygen,(i+1)*_hammerOxygenIncrement)
	}
}


//currency
global.finalOxygen=floor(oxygen)
global.finalEnemyKillCoins=0

//modifier creation
for (var i =0;i<array_length(global.modifiers);i++){
	instance_create_depth(372+i*32,y+128,3,CardModifier,{
		sprite_index:global.modifiers[i]
	})
}

global.tutorial=false

//set weapon stats
if (global.weapon==oArrow){
	attackLength=-count(global.skills,"Reload")*2
	attackCooldown=40
}

if (global.devMode){
	global.finalCoins=99
}

instance_create_depth(x,y,0,oOxygenBar)