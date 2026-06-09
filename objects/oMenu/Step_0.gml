if (keyboard_check_pressed(vk_escape)){
    paused=!paused
    
    if (paused){
        quitToMenu=instance_create_layer(oCamera.x,oCamera.y-50,"Ladder",oButton,{
            image_xscale:20,
            image_yscale:5,
            font_size:3,
            button_text:"Quit To Menu",
            func:function() {room_goto(Menu)}
        })
        quitGame=instance_create_layer(oCamera.x,oCamera.y+50,"Ladder",oButton,{
            image_xscale:20,
            image_yscale:5,
            font_size:3,
            button_text:"Quit",
            func:function() {game_end()}
        })
    }else {
    	instance_destroy(quitToMenu)
        instance_destroy(quitGame)
    }
}