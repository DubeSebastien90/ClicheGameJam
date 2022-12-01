var scale = 4.8

//contour
draw_sprite_ext(spr_cellphone,0,room_width/2,room_height/2,scale,scale,0,c_white,1)

//screen
draw_sprite_ext(spr_screen,screen,room_width/2,room_height/2,scale,scale,0,c_white,1)
temps += 0.04
if (screen = 0){
//buttons
//var gros = sprite_get_width(spr_button)*2
draw_set_font(fnt_pixel)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
for (var i = 1; i <= nb_buttons; i++){
	draw_set_color(c_white)
	draw_text_transformed(room_width/2,buttonY[i],buttonText[i],0.5,0.5,0)
	if (button_selected = i){
		draw_text_transformed(room_width/2-(string_width(buttonText[i])/4)-4-sin(temps),buttonY[i],">",0.5,0.5,0)
		draw_text_transformed(room_width/2+(string_width(buttonText[i])/4)+4+sin(temps),buttonY[i],"<",0.5,0.5,0)	
	}
}
} else if screen = 1{
	draw_set_font(fnt_pixel)
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	draw_set_color(c_white)
	var faceScale = 4
	draw_text_transformed(room_width/2,50,text[button_selected],0.5,0.5,0)
	draw_text_transformed(room_width/2,140,"Spacebar to confirm",0.5,0.5,0)
	draw_sprite_ext(spr_face,index[4],room_width/2,room_height/2,faceScale,faceScale,0,c_white,1)
	draw_sprite_ext(spr_eye,index[3],room_width/2,room_height/2,faceScale,faceScale,0,c_white,1)
	draw_set_color(c_white)
	draw_sprite_ext(cheveux[index[1]],index[2],room_width/2,room_height/2,faceScale,faceScale,0,c_white,1)
	//arrows
	draw_sprite_ext(spr_arrow,0,room_width/2+40+sin(temps),room_height/2,1,1,180,c_white,1)
	draw_sprite_ext(spr_arrow,0,room_width/2-40-sin(temps),room_height/2,1,1,0,c_white,1)
	draw_sprite_ext(spr_arrow,0,room_width/2,room_height/2+30+sin(temps),1,1,90,c_white,1)
	draw_sprite_ext(spr_arrow,0,room_width/2,room_height/2-30-sin(temps),1,1,-90,c_white,1)
} else if screen = 2{
	draw_set_font(fnt_pixel)
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	draw_set_color(c_white)
	draw_text_transformed(room_width/2,140,"Spacebar to continue",0.45,0.45,0)
	draw_text_ext_transformed(room_width/2,room_height/2-10,"Our goal is to make you find the love of your life by letting you make contact with new people!",22,230,0.45,0.45,0)
} else if screen = 3{
	//tutorial
	if tutorial = false{
		a = lerp(a,0,0.015)
	}
	if a > 0.01{
		draw_set_alpha(a)
		draw_set_halign(fa_center)
		draw_set_color(c_black)
		draw_text_ext_transformed(room_width/5,room_height/2,"Swipe left if you don't like them",20,200,0.5,0.5,0)
		draw_text_ext_transformed(room_width/5*4,room_height/2,"Swipe right if you want to date them",20,180,0.5,0.5,0)
	}
	
	draw_set_alpha(1)
	var personne = arrayPersonne[nb_personnes]
	//datingApp
	draw_set_font(fnt_pixel)
	draw_set_halign(fa_left)
	draw_set_valign(fa_center)
	draw_set_color(c_black)
	draw_text_transformed(124,110,personne[nb_attraits+1],0.6,0.6,0)
	draw_set_valign(fa_top)
	//description
	if !matched{
		draw_set_color(c_black)
		draw_text_ext_transformed(124,115,personne[nb_attraits+3],18,240,0.4,0.4,0)
	} else{
		draw_set_color(c_red)
		draw_set_halign(fa_center)
		draw_set_valign(fa_center)
		temps += 0.01
		draw_text_transformed(room_width/2,135,"Matched!",1,1,sin(temps)*10)
	}
	
	draw_set_color(c_black)
	draw_set_halign(fa_right)
	draw_set_valign(fa_center)
	draw_text_transformed(216,110,personne[nb_attraits+2],0.6,0.6,0)
	draw_sprite_ext(spr_fond,personne[nb_attraits+4],room_width/2,room_height/2,scale,scale,0,c_white,0.4)
	//visage
	var faceScale = 4.8
	draw_sprite_ext(spr_corps,personne[nb_attraits+6],room_width/2,72,faceScale*personne[nb_attraits+5],faceScale,0,c_white,1)
	draw_sprite_ext(spr_face,personne[4],room_width/2,72,faceScale*personne[nb_attraits+5],faceScale,0,c_white,1)
	draw_sprite_ext(spr_eye,personne[3],room_width/2,72,faceScale*personne[nb_attraits+5],faceScale,0,c_white,1)
	draw_set_color(c_white)
	draw_sprite_ext(cheveux[personne[1]],personne[2],room_width/2,72,faceScale*personne[nb_attraits+5],faceScale,0,c_white,1)
} else if screen = 4{
	temps += 0.05
	draw_set_color(c_black)
	draw_set_alpha(1)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	var personne = arrayPersonne[nb_personnes]
	//entete
	draw_text_transformed(140,43,personne[nb_attraits+1],0.5,0.5,0)
	draw_tete(personne,130,48,1.5)
	draw_sprite_ext(spr_textBox,0,room_width/2,room_height/2,scale,scale,0,c_white,1)
	//propositions
	for(var i = 0; i < 3 && !waiting && !fini; i++){
		draw_set_color(c_black)
		draw_set_halign(fa_center)
		draw_text_transformed(room_width/2,123+(i*10),textProp[i],0.4,0.4,0)
		if button_selected = i + 1 && discussionDone != 3{
			draw_text_transformed(room_width/2-string_width(textProp[i])/scale -3-sin(temps),123+(i*10),">",0.4,0.4,0)
			draw_text_transformed(room_width/2+string_width(textProp[i])/scale +3+sin(temps),123+(i*10),"<",0.4,0.4,0)		
		}
	}
	//textos
	for(var i = 0; i < textISent; i++){
		var plus = 0
		if i > 0{
			plus = discussion_length
		}
		draw_set_halign(fa_right)
		draw_text_transformed(208,58+(18*i)+plus,textI[i],0.4,0.4,0)
		draw_tete(index,215,63+(18*i)+plus,-1)
	}
	for(var i = 0; i < textTheySent; i++){
		var plus = 0
		if i > 0{
			plus = discussion_length
		}
		draw_set_halign(fa_left)
		draw_text_transformed(132,67+(18*i)+plus,textT[i],0.4,0.4,0)
		draw_tete(personne,125,72+(18*i)+plus,1)
		if i = 0 && discussion_length != 0{
			draw_sprite_ext(spr_flou,nudes,132,76,1,1,0,c_white,1)
		}
	}
	if waiting{
		var plus = 0
		if i > 0{
			plus = discussion_length
		}
		subBubble += 0.08
		var i = textTheySent
		draw_tete(personne,125,72+(18*i)+plus,1)
		draw_sprite_ext(spr_bubble,subBubble,135,70+(18*i)+plus,1,1,0,c_white,1)
	}
	//cacheTexto - cinématique
	if startCine = true{
		alphaC = lerp(alphaC,1,0.1)
		draw_sprite_ext(spr_cache,0,room_width/2,room_height/2,scale,scale,0,c_white,alphaC)
		if alphaC > 0.95{
			draw_set_color(c_white)
			draw_set_halign(fa_center)
			draw_set_valign(fa_center)
			draw_text_ext_transformed(room_width/2,room_height/2-10,text_fin[discussionDone],18,220,0.45,0.45,0)
			if (discussionDone != 2){
				draw_text_transformed(room_width/2,room_height/2+40,"Space to return swiping",0.40,0.40,0)
			} else draw_text_transformed(room_width/2,room_height/2+40,"Space to continue",0.40,0.40,0)
			
		}
	}
} else if screen = 5{
	var scale = 5
	var dscale = 5 / (60/(_y-60))
	if gun = false{
	_y -= spd*dscale
	} 
	draw_sprite_ext(spr_cinematique,nb_dates,0,0,scale,scale,0,c_white,1)
	draw_sprite_ext(spr_cinematique,nb_dates,0,0,scale,scale,0,c_grey,0.3)
	draw_corps(index,room_width/2-(_x*dscale)/5,_y,dscale)
	draw_corps(arrayPersonne[nb_personnes],room_width/2+(_x*dscale)/5,_y,-dscale)
	if gun = true{
		draw_sprite_ext(spr_gun,0,(room_width/2)-_x*dscale/5+10,_y+14,3,3,20,c_white,1)
	}
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	draw_set_color(c_white)
	if nb_dates != 3{
		draw_text_transformed(room_width/2,15,textCine[textCineNum],0.7,0.7,0)
	} else if gun = false{
		draw_text_transformed(room_width/2,15,textCineFin[textCineNum],0.7,0.7,0)
	} else if gun = true{
		draw_text_transformed(room_width/2,15,textCineFin[4],0.7,0.7,0)
	}
	if tempsHop < 0 && textCineNum < nb_cineText-1{
		tempsHop += 360
		textCineNum += 1
	}
	tempsHop -= 1
	if textCineNum = nb_cineText-1 && changeScene = false && tempsHop < 100 && nb_dates !=3{
		changeScene = true
	} else if textCineNum = nb_cineText-1 && changeScene = false && tempsHop < 100 && nb_dates = 3 && gun = false{
		gun = true
		alarm[3] = 360
		obj_game.playSound2(snd_gun_reload)
	}
}

//bloc
draw_set_color(c_black)
draw_set_alpha(alphaBloc)
draw_rectangle(0,0,room_width,room_height,false)
draw_set_alpha(1)
if showJournal{
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white)
	if nb_dates != 3{
		Jscale = lerp(Jscale,1,0.04)
		if Jscale > 0.95 && sndPlay = false{
			sndPlay = true
			obj_game.playSound2(snd_journal)
		}
		draw_text_ext_transformed(15,10,years+", "+arrayPersonne[nb_personnes][nb_attraits+1]+accident[acc],20,room_width+20,0.7,0.7,0)
		draw_sprite_ext(spr_journal,acc,room_width/2,room_height/2,Jscale*0.9,Jscale*0.9,rot,c_white,1)
		draw_set_valign(fa_bottom)
		draw_text_transformed(15,room_height-25,"Unfortunately, all good things come to an end...",0.7,0.7,0)
		draw_text_transformed(15,room_height-5,"Press space to return on Tinda",0.7,0.7,0)
	} else{
		if scene = 0{
			draw_set_valign(fa_top)
			draw_text_ext_transformed(15,10,years,20,room_width+100,0.7,0.7,0)
			draw_tete(index,room_width/2,room_height/2+4,5)
			draw_sprite_ext(spr_cinematique_barreaux,0,room_width/2,room_height/2,4,4,0,c_white,1)
			draw_set_valign(fa_bottom)
			draw_text_transformed(15,room_height-25,"News reported : Tinda Killer is finally caught",0.7,0.7,0)
			draw_text_transformed(15,room_height-5,"Press space to continue",0.7,0.7,0)
		} else{
			Jscale = lerp(Jscale,1,0.1)
			if Jscale > 0.95 && sndPlay = false{
				sndPlay = true
				obj_game.playSound2(snd_journal)
			}
			draw_set_valign(fa_top)
			draw_text_ext_transformed(15,10,"Fortunately,the guards were easy to seduce",20,room_width+100,0.7,0.7,0)
			draw_sprite_ext(spr_journal,acc,room_width/2,room_height/2-15,Jscale*0.9,Jscale*0.9,rot,c_white,1)
			draw_set_valign(fa_bottom)
			draw_text_transformed(15,room_height-45,"Hehehehehe, they won't get me anymore",0.7,0.7,0)
			draw_text_transformed(15,room_height-25,"I got surgery! New city, new me... hehehe",0.7,0.7,0)
			draw_text_transformed(15,room_height-5,"Press space return on Tinda",0.7,0.7,0)
		}
	}
}


