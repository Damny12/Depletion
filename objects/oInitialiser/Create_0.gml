window_enable_borderless_fullscreen(true)

//globals
global.drainMult=1
global.coinOxygenConversion=1
global.finalCoins=0
global.finalEnemyKillCoins=0
global.skills=[]
global.skillDescriptions={
    "Poison":"Deals damage over time.\nEvery purchase of this upgrade\nmakes the enemy take\nanother tick of damage.",
    "Strength":"Makes your weapon do\nmore damage per hit. Every\npurchase you do 1\nmore damage per hit.",
    "Glide":"Makes you able to\nGlide when reaching a certain\nspeed. Every purchase makes\ngliding faster and lower\ngravity.",
    "Knockback":"Increases the amount\nyou push enemies back\nby. Every purchase makes\nyou knock them back by\n25% more."
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

global.originalWindowPositionX=window_get_x()
global.originalWindowPositionY=window_get_y()

//enemies
global.enemyHp=0
global.enemies=[
    oRedSlime,
    oSeaPig
]

//keybinds
global.rightKey="D"
global.leftKey="A"
global.spaceKey="W"
global.attackKey="E"

if (room==StartUp){
    global.devMode=true
    global.deactivateBubbles=false
    global.deactivateCoins=false
    global.vsync=true
    global.fullScreen=true
    display_reset(false,global.vsync)
    window_set_fullscreen(global.fullScreen)
    room_goto(Menu)
}