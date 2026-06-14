function vsync(){
    global.vsync=!global.vsync
    display_reset(false,global.vsync)
    self.check=global.vsync
}