press_space = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)

if (keyboard_check_pressed(vk_down)&&!waiting){
	if button_selected < nb_buttons{
		button_selected += 1
		obj_game.playSound(snd_interraction,0.2)
	}
}
if (keyboard_check_pressed(vk_up)&&!waiting){
	if button_selected > 1{
		button_selected -= 1
		obj_game.playSound(snd_interraction,0.2)
	}
}

if screen = 1{
	nbIndexes[2] = sprite_get_number(cheveux[index[1]])
	if (keyboard_check_pressed(vk_left)){
		obj_game.playSound(snd_interraction,0.2)
		if index[button_selected] > 0{
			index[button_selected] -= 1
		} else index[button_selected] = nbIndexes[button_selected] - 1
	}	
	if (keyboard_check_pressed(vk_right)){
		obj_game.playSound(snd_interraction,0.2)
		if index[button_selected] < nbIndexes[button_selected] - 1{
			index[button_selected] += 1
		} else index[button_selected] = 0
	}	
}
if screen = 3{
	if (keyboard_check_pressed(vk_left)){
		tutorial = false
		//non
		if !matched{
			arrayPersonne[nb_personnes][nb_attraits+8] = -1
			instance_create_depth(room_width/2,room_height/2,depth - 1,obj_clone_screen)
			createNewPerson()
			obj_game.playSound(snd_woosh,0.2)
		}
	} else if (keyboard_check_pressed(vk_right)){
		tutorial = false
		//oui
		if !matched{
			nb_oui += 1
			arrayPersonne[nb_personnes][nb_attraits+8] = 1
			if nb_oui!=match_possibility{
				instance_create_depth(room_width/2,room_height/2,depth - 1,obj_clone_screen)
				createNewPerson()
				obj_game.playSound(snd_woosh,0.4)
			} else{
				match()
				obj_game.playSound(snd_woosh,0.4)
				obj_game.playSound(snd_match,0)
			}
		}
	}
}

if press_space{
	if screen = 0{
		if button_selected = 1{
			obj_game.playSound(snd_interraction,0.2)
			screen = 1
			button_selected = 1
			nb_buttons = nb_attraits
		} else if button_selected = 2{
			obj_game.playSound(snd_interraction,0.2)
			screen = 2
			nb_buttons = 0
			button_selected = 0
		}
	} else if screen = 1{
		createNewPerson()
		screen = 3
		nb_buttons = 0
		button_selected = 0
		obj_game.playSound(snd_interraction,0.2)
	} else if screen = 2{
		screen = 0
		button_selected = 1
		nb_buttons = 2
		obj_game.playSound(snd_interraction,0.2)
	} else if screen = 3{
		//rien man
	} else if screen = 4{
		if (!waiting && !fini){
			obj_game.playSound2(snd_texto_send)
			textI[textISent] = textProp[button_selected - 1]
			textISent += 1
			if (discussionDone = 0){
				waiting = true
				alarm[1] = random_range(180,300)
			} else{
				nb_buttons = 0
				button_selected = 0
				fini = true
				if discussionDone = 1{
					//perdu et retour à swipe
					alarm[2] = 200
				}
				if discussionDone = 2{
					//GAGNÉ *******
					alarm[2] = 200
				}
			}
		}
		if startCine && alphaC > 0.95{
				if discussionDone != 2{
				matched = false
				match_possibility = choose(4,5,6,7,8,9)
				nb_oui = 0
				a = 0
				createNewPerson()
				screen = 3
				nb_buttons = 0
				button_selected = 0
				alphaC = 0
				obj_game.playSound(snd_interraction,0.2)
			} else{
				//start cinematique
				obj_game.playSound(snd_interraction,0.2)
				changeScene = true
				nb_buttons = 0
				button_selected = 0
			}
		}
	} else if screen = 5{
		if showJournal && nb_dates != 3{
		createNewPerson()
		screen = 3
		nb_buttons = 0
		button_selected = 0
		obj_game.playSound(snd_interraction,0.2)
		if wantMusic{
		audio_emitter_gain(emitterMainMusic,1)
		}
		showJournal = false
		changeScene = false
		matched = false
		match_possibility = choose(4,5,6,7,8,9)
		nb_oui = 0
		a = 0
		alphaC = 0
		nb_dates += 1
		} else{
			if scene = 0{
			scene += 1
			} else{
				game_restart()
			}
		}
	}
}

if changeScene{
	var val = 0.1
	if textCineNum = nb_cineText-1{
		val = 0.04
	}
	alphaBloc = lerp(alphaBloc,1,val)
	if alphaBloc > 0.95{
		if textCineNum = nb_cineText-1 && showJournal = false{
			getJournal()
			showJournal = true
			obj_game.playSound2(snd_thunder)
		} else if textCineNum != nb_cineText-1{
			screen = 5
			changeScene = false
			setTextCine()
		}
	}
}
if !changeScene{
	alphaBloc = lerp(alphaBloc,0,0.1)
}
if showJournal = false && screen = 5{
	audio_emitter_gain(emitterMusic,(1-alphaBloc)*1)
} else {
	audio_emitter_gain(emitterMusic,0)
}