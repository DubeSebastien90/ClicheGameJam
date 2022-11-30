
if obj_cellphone.nb_personnes > 1{
	//datingApp
	draw_sprite_ext(spr_screen,3,x,y,scale,scale,0,c_white,1)
	draw_set_font(fnt_pixel)
	draw_set_halign(fa_left)
	draw_set_valign(fa_center)
	draw_set_color(c_black)
	draw_text_transformed(x-46.5,y+14,personne[nb_attraits+1],0.6,0.6,0)
	draw_set_valign(fa_top)
	draw_text_ext_transformed(x-46.5,y+19,personne[nb_attraits+3],18,240,0.4,0.4,0)
	draw_set_halign(fa_right)
	draw_set_valign(fa_center)
	draw_text_transformed(x+45.5,y+14,personne[nb_attraits+2],0.6,0.6,0)
	draw_sprite_ext(spr_fond,personne[nb_attraits+4],x,y,scale,scale,0,c_white,0.4)
	//visage
	var faceScale = 4.8
	draw_sprite_ext(spr_corps,personne[nb_attraits+6],x,y-24,faceScale*personne[nb_attraits+5],faceScale,0,c_white,1)
	draw_sprite_ext(spr_face,personne[4],x,y-24,faceScale*personne[nb_attraits+5],faceScale,0,c_white,1)
	draw_sprite_ext(spr_eye,personne[3],x,y-24,faceScale*personne[nb_attraits+5],faceScale,0,c_white,1)
	draw_set_color(c_white)
	draw_sprite_ext(cheveux[personne[1]],personne[2],x,y-24,faceScale*personne[nb_attraits+5],faceScale,0,c_white,1)
}