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
    "Poison":"Deals damage over time. Every purchase of this upgrademakes the enemy take another tick of damage.",
    "Strength":"Makes your weapon domore damage per hit. Every purchase you do 1 more damage per hit.",
    "Knockback":"Increases the amount you push enemies back by. Every purchase makes you knock them back by 25% more.",
	"Bow":"Replaces your current weapon with a bow that shoots in the direction your mouse.",
	"Breathing":"Reduces the amount of oxygen that you use and allows you to attack more times with the hammer",
	"Sword":"Replaces your current weapon with a sword that can attack and push enemies back.",
	"Reload":"Decreases the time betwee neach shot of your bow.",
	"Hammer":"Does double the damage of the sword, but drains your oxygen every swing."
}
global.modifiers=[]
global.modifierDescription={
	"GrowingPressure":"Your oxygen drain will drain faster every second.",
	"CrabClaw":"Crabs take more oxygen from you when attacking."
}

global.modifierStatsDescription={
	"GrowingPressure":$"{global.drainMult}x",
	"CrabClaw":$"{count(global.modifiers,CrabClaw)}x"
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

global.cards=[{
	title:"Poison",
	asset:poison,
	cost:4,
	weapon:[global.weapon],
	isWeapon:false
},{
	title:"Strength",
	asset:strength,
	cost:5,
	weapon:[global.weapon],
	isWeapon:false
},{
	title:"Knockback",
	asset:knockback,
	cost:3,
	weapon:[global.weapon],
	isWeapon:false
},{
	title:"Breathing",
	asset:BreathHolding,
	cost:6,
	weapon:[global.weapon],
	isWeapon:false
},{
	title:"Bow",
	asset:BowAndArrow,
	cost:8,
	weapon:["!",oArrow],
	isWeapon:true
},{
	title:"Sword",
	asset:Sword,
	cost:11,
	weapon:["!",oAttack],
	isWeapon:true
},{
	title:"Reload",
	asset:ArrowReload,
	cost:8,
	weapon:[oArrow],
	isWeapon:false
},{
	title:"Hammer",
	asset:Hammer,
	cost:13,
	weapon:["!",oHammer],
	isWeapon:true
}]

function setGlobal(name,value){
	try {
		global[$ name] = value
	}
	catch (error) {
		show_debug_message(error)
	}
}

if (room==StartUp){
	global.volume = 100
	global.tutorial=true
	global.devMode=false
	global.deactivateBubbles=false
	global.deactivateCoins=false
	global.vsync=true
	global.fullScreen=false
	global.newCameraMode=true
	
	display_reset(false,global.vsync)
	window_set_fullscreen(global.fullScreen)
}

if (room==StartUp){
	room_goto(Menu)
}