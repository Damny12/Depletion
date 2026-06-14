function fullScreen(){
    global.fullScreen=!global.fullScreen
    self.check=global.fullScreen
    window_set_fullscreen(global.fullScreen)
    if (!global.fullScreen){
        window_set_position(global.originalWindowPositionX,global.originalWindowPositionY)
    }
}