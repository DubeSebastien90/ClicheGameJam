waiting = false
button_selected = 1
//choose answer
var ohoh = choisirTexto(textISent,textI[textISent-1])

textT[textTheySent] = ohoh[0]
textProp[0] = ohoh[1]
textProp[1] = ohoh[2]
textProp[2] = ohoh[3]
textTheySent += 1
discussion_length += ohoh[4]
discussionDone = ohoh[5]

if discussion_length != 0 && nudes = -1{
	var personne = arrayPersonne[nb_personnes]
	var value = 1
	if personne[nb_attraits + 7] = 0{
	value = 1
	} else value = 2
	nudes = choose(0,value)
}

if discussionDone = 3{
	//tu aaas des nudes!
	alarm[2] = 200
	nb_buttons = 0
	fini = true
	button_selected = 0
}

obj_game.playSound2(snd_texto_received)


