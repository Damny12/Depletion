window_enable_borderless_fullscreen(true)

//globals
global.floorLevel=0
global.weapon=oAttack
global.drainMult=1
global.coinOxygenConversion=1
global.finalCoins=0
global.finalEnemyKillCoins=0
global.skills=[]
global.skillDescriptions={
    "Poison":"Deals damage over time.\nEvery purchase of this upgrade\nmakes the enemy take\nanother tick of damage.",
    "Strength":"Makes your weapon do\nmore damage per hit. Every\npurchase you do 1\nmore damage per hit.",
    "Knockback":"Increases the amount you push\n enemies back by. Every\n purchase makes you knock\n them back by 25% more.",
	"Bow":"Replaces your current weapon\nwith a bow that shoots in the\n direction your mouse.",
	"Breathing":"Reduces the amount of\n oxygen that you use\nand allows you\nto attack more times\n with the hammer",
	"Sword":"Replaces your current weapon\n with a sword that can attack\n and push enemies back.",
	"Reload":"Decreases the time between\neach shot of your bow.",
	"Hammer":"Does double the damage of the\nsword, but drains your\n oxygen every swing."
}
global.modifiers=[]
global.modifierDescription={
	"GrowingPressure":"Your oxygen drain will drain faster every second.",
	"CrabClaw":"Crabs take more oxygen from you when attacking."
}

global.modifierStatsDescription={
	"GrowingPressure":$"{global.drainMult}x",
	"CrabClaw":$"{Count(global.modifiers,CrabClaw)}x"
}

//enemies
global.enemyHp=0
global.enemies=[
    oCrab,
    oSeaPig,
	oSeaHorse,
	oSwordFish,
	oCrabClaw
] 
global.projectiles=[
	oBabySeaHorse,
	oBabySeaHorseExplodee,
	oBabySeaHorseExplosion
]

//keybinds
global.rightKey="D"
global.leftKey="A"
global.spaceKey="W"
global.attackKey="E"

if (room==StartUp){
	global.tutorial=true
    global.devMode=false
    global.deactivateBubbles=false
    global.deactivateCoins=false
    global.vsync=true
    global.fullScreen=true
	global.newCameraMode=true
    display_reset(false,global.vsync)
    window_set_fullscreen(global.fullScreen)
    room_goto(Menu)
}