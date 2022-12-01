// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function choisirTexto(numText,textRecu) constructor{
	
	var texto
	texto[0] = ""
	texto[1] = ""
	texto[2] = ""
	texto[3] = ""
	texto[4] = 0
	texto[5] = 0
	
	var recu0
	recu0[0] = "Hi!"
	recu0[1] = "You're pretty"
	recu0[2] = "Send nudes"
	
	var send
	send[0][0] = "Wanna go on a date?"
	send[0][1] = "Wanna have sexy time?"
	send[0][2] = "Wanna have dinner?"
	
	send[1][0] = "Wanna go on a date?"
	send[1][1] = "Wanna have sexy time?"
	send[1][2] = "Wanna have dinner?"
	send[1][3] = "You're to confident"
	send[1][4] = "Pfff what an answer"
	send[1][5] = "Wanna go on a date?"
	
	send[2][0] = "Bye"
	send[2][1] = "You're boring"
	send[2][2] = "Ok sorry..."
	send[2][3] = "Sexyyy"
	send[2][4] = "You look gorgeous"
	send[2][5] = "Ewwwch!"
	
	
	if numText = 1{
		if textRecu =recu0[0]{
			texto[0] = choose("Hello","Hi","Wassup!")
			texto[1] = send[0][0]
			texto[2] = send[0][1]
			texto[3] = send[0][2]
		}
		if textRecu = recu0[1]{
			texto[0] = choose("Thanks","U too!","I know...")
			if texto[0] != "I know..."{
				texto[1] = send[1][0]
				texto[2] = send[1][1]
				texto[3] = send[1][2]
			} else{
				texto[1] = send[1][3]
				texto[2] = send[1][4]
				texto[3] = send[1][5]
				
			}
		}
		if textRecu = recu0[2]{
			texto[0] = choose("No! Ewwww","Ok lol", "Why not")
			if (texto[0] = "No! Ewwww" && obj_cellphone.rejected = false){
				texto[1] = send[2][0]
				texto[2] = send[2][1]
				texto[3] = send[2][2]
				texto[5] = 1
				obj_cellphone.rejected = true
			} else {
				texto[0] = choose("Ok lol", "Why not")
				texto[1] = send[2][3]
				texto[2] = send[2][4]
				texto[3] = send[2][5]
				texto[4] = 21
			}
		}
	}
	if numText = 2{
		if (textRecu = send[0][0] || textRecu = send[0][1] || textRecu = send[0][2] || textRecu = send[1][0] || textRecu = send[1][1] || textRecu = send[1][2] || textRecu = send[1][5]){
			texto[0] = choose("Yeah", "Absolutely!","Hmm naaah")
			if (texto[0] = "Yeah" || texto[0] = "Absolutely!" || obj_cellphone.rejected = true){
				texto[1] = "Cool! See you there!"
				texto[2] = "YAAAASSS!"
				texto[3] = "Ooooh yeah"
				texto[5] = 2
				if obj_cellphone.rejected = true{
					texto[0] = choose("Yeah", "Absolutely!")
				}
			} else{
				texto[1] = "Bye"
				texto[2] = "Ok looser"
				texto[3] = "Ok have a great day"
				texto[5] = 1
				obj_cellphone.rejected = true
			}
		} else if (textRecu = send[1][3] || textRecu = send[1][4]){
			texto[0] = choose("Yeah and what?", "It's obvious")
			texto[1] = "Ok byyyye"
			texto[2] = "Ewch... bye"
			texto[3] = "Ciao!"
			texto[5] = 1
		} else if (textRecu = send[2][3] || textRecu = send[2][4]){
			texto[0] = choose("Haha thanks!", "Yeah", "Have fun")
			texto[5] = 3
		} else if (textRecu = send[2][5]){
			texto[0] = choose("OMG stop!", "You're so mean!", "I don't care")
			texto[5] = 3
		}
	}
	
	return texto
}