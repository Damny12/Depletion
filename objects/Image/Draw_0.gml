draw_self()
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

draw_set_font(GUI_Font)

draw_text_transformed(x,y-170,"Cost:"+string(cost),4,4,0)
draw_text_transformed(x,y+170,skillName,4,4,0)