hp = global.enemyHp * 10

//tentacle grabbing
tentacleGrabDamage = 2
tentacleAttacks = 4
tentacleDelay = 60
mostRecent = noone

//tentacle slamming
tentacleSlamDamage = 2
tentacleSlamAttacks = 1
tentacleSlamDelay = 60

phase = 2
attacks = 0

//tick related variables
poisonedDuration = -1
tickAmount = 1
ticks = 0

//stretching
stretchX = 0
stretchY = 0

x = room_width / 2
y = room_height - 64

image_xscale = 6
image_yscale = 6
image_blend = make_colour_rgb(125,125,125)
depth = layer_get_depth("Background")-1