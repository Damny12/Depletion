maxHp=global.enemyHp+defaultHp
hp=global.enemyHp+defaultHp

//movement
defaultMoveSpeed=0.2
movDir=1
movespeed=defaultMoveSpeed*movDir
termVel=defaultTermVel

//wandering
wanderSpeed=1

xspd=0
xFriction=1.1

//damaging
iframes=0
secondsOfInvincibility=0.7
poisonedDuration=-1

//tickers
healTick=0
knockBackTick=0
wanderTick=0
shootDelayTick=0

while (place_meeting(x,y,layer_tilemap_get_id("Ground"))) {
	x++
}