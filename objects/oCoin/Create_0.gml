yGravity=0.1
yVel=-3
yTerm=5
xVel=random_range(-1.0,1.0)

scale=random_range(0.75,1.25)
rotVel=random_range(-10.0,10.0)

rotation=0

image_xscale=scale
image_yscale=scale

coinNoises = [
	coin_1,
	coin_2,
	coin_3,
	coin_4
]

audio_play_sound(coinNoises[irandom_range(0,3)], instance_count, false, global.volume/100)

oCamera.shakePower = 1.25
oCamera.shakeValue = 2