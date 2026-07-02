draw_self()

//draw health and set font
draw_set_font(GUI_Font)
draw_text_transformed(x,y-textDisplayOffset,string(hp)+"/"+string(maxHp),1,1,0)