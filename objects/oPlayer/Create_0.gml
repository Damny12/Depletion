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
jumped=false

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

damageSource=""
drainIncrease=Count(global.modifiers,GrowingPressure)*0.04

//enemy stuff
iframes=0

//attacking
attackCooldown=30
attackDmg=1
attackDebounce=0
attackLength=20
attackObject=noone
attackWeapon=oAttack

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
skillSet=global.skills
attackDmg=1+Count(skillSet,"Strength")

knockbackMult=1+Count(skillSet,"Knockback")/4

//poison
poisonTicks=[]
poisonDmg=1

//glide
glideToggle=false
glideGrav=defaultgrav/10
glideTerminal=defaultTermVel/2
glideSpeed=defaultMoveSpd*(1+Count(skillSet,"Glide")/8)
glideSoftCapSpeed=0.02+defaultgrav

//poison timing
for(var i=0;i<Count(skillSet,"Poison");i++){
	array_push(poisonTicks,60*(round(i/Count(skillSet,"Poison")*10))/10)
}

if (Count(skillSet,"Poison")==0){
	poisonDmg=0
}else{
	poisonDmg=1
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

instance_create_layer(x,y+160,"PlayerStuff",oOxygenBar)