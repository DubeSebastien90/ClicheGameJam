randomize()
//menu
nb_buttons = 2
button_selected = 1

draw_set_font(fnt_pixel)

buttonY[1] = 100
buttonText[1] = "Create account"

buttonY[2] = 130
buttonText[2] = "Instructions"

//people

nb_attraits = 4

nb_cheveux = 8
cheveux[0] = spr_hair_1
cheveux[1] = spr_hair_2
cheveux[2] = spr_hair_3
cheveux[3] = spr_hair_4
cheveux[4] = spr_hair_cap
cheveux[5] = spr_hair_hat
cheveux[6] = spr_hair_horns
cheveux[7] = spr_hair_bald
//cheveux
nbIndexes[1] = nb_cheveux
text[1] = "Hairs"
//couleur cheveux
nbIndexes[2] = 0
text[2] = "Hair color"
//yeux
nbIndexes[3] = sprite_get_number(spr_eye)
text[3] = "Eyes"
//peau
nbIndexes[4] = sprite_get_number(spr_face)
text[4] = "Skin color"

for(var i = 1; i <= nb_attraits; i++){
	if (i != 2){
		index[i] = round(random_range(-0.49,nbIndexes[i]-0.51))
	} else index[i] = round(random_range(-0.49,sprite_get_number(cheveux[1])-0.49))
}

index[nb_attraits+6] = 0

temps = 0
screen = 0

nb_personnes = 0
arrayPersonne = noone

function createNewPerson(){
	var personne;
	for(var i = 1; i <= nb_attraits; i++){
		if (i != 2){
			personne[i] = round(random_range(-0.49,nbIndexes[i]-0.51))
		} else personne[i] = round(random_range(-0.49,sprite_get_number(personne[1])-0.49))
	}
	//sexe
	if (personne[1] = 0 || personne[1] = 2){
		personne[nb_attraits + 7] = 0
	} else if (personne[1] = 1 || personne[1] = 6){
		personne[nb_attraits + 7] = 1
	} else {
		personne[nb_attraits + 7] = choose(0,1)
	}
	//nom
	personne[nb_attraits + 1] = choisirNom(personne[nb_attraits + 7])
	//age
	personne[nb_attraits + 2] = round(random_range(17.51,26.49))
	//description
	personne[nb_attraits + 3] = choisirDescription(personne[nb_attraits + 7])
	//fond
	personne[nb_attraits + 4] = round(random_range(-0.49,sprite_get_number(spr_fond)-0.49))
	//côté
	personne[nb_attraits + 5] = choose(1,-1)
	//corps
	personne[nb_attraits + 6] = round(random_range(-0.49,sprite_get_number(spr_corps)-0.49))
	//accepted
	personne[nb_attraits + 8] = 0
	
	
	nb_personnes += 1;
	arrayPersonne[nb_personnes] = personne
}


//match
nb_oui = 0
match_possibility = choose(4,5,6,7,8,9)
matched = false
temps = 0
tutorial = true
a = 1

function match(){
	matched = true
	screenShake(3,30)
	alarm[0] = 240
}

function draw_tete(perso, X,Y,scale)constructor{
	draw_sprite_ext(spr_face,perso[4],X,Y,scale,abs(scale),0,c_white,1)
	draw_sprite_ext(spr_eye,perso[3],X,Y,scale,abs(scale),0,c_white,1)
	draw_sprite_ext(cheveux[perso[1]],perso[2],X,Y,scale,abs(scale),0,c_white,1)
}

function draw_corps(perso, X,Y,scale)constructor{
	draw_sprite_ext(spr_face,perso[4],X,Y,scale,abs(scale),0,c_white,1)
	draw_sprite_ext(spr_eye,perso[3],X,Y,scale,abs(scale),0,c_white,1)
	draw_sprite_ext(cheveux[perso[1]],perso[2],X,Y,scale,abs(scale),0,c_white,1)
	draw_sprite_ext(spr_corps_full,perso[nb_attraits + 6],X,Y,scale,abs(scale),0,c_white,1)
	draw_sprite_ext(spr_mains,perso[4],X,Y,scale,abs(scale),0,c_white,1)
}

//clavardage
rejected = false
text_fin[1] = "Too bad for you, better luck next time"
text_fin[2] = "Yay!! Get ready, you're going on a date!"
text_fin[3] = "Great job! You got a nude, now you can try to find the love of your life"
changeScene = false
alphaBloc = 0
waiting = false
function startClavardage(){
	waiting = false
textISent = 0
textTheySent = 0
for(var i = 0; i < 5; i++){
	textI[i] = ""
	textT[i] = ""
}
textProp[0] = "Hi!"
textProp[1] = "You're pretty"
textProp[2] = "Send nudes"
subBubble = 0
discussion_length = 0
discussionDone = 0
fini = false
alphaC = 0
startCine = false
nudes = -1
changeScene = false
alphaBloc = 0
textCineNum = 0
}

//cinémaqtique
tempsHop = 400
nb_cineText = 4
showJournal = false
textCineNum = 0
acc = 0
sndPlay = false
emitterMusic = audio_emitter_create()
nb_dates = 1
scene = 0
gun = false
range = 0
function setTextCine(){
	range = 0
	gun = false
	scene = 0
	audio_emitter_gain(emitterMainMusic,0)
	if nb_dates!=3{
		audio_play_sound_on(emitterMusic,snd_musicCine,false,1)
	} else audio_play_sound_on(emitterMusic,snd_musicCine,true,1)
	acc = 0
	showJournal = false
	tempsHop = 430
	_x = 35.5
	_y = 150
	spd = 0.01
	textCineNum = 0
	textCine[0] = "My date was great!"
	textCine[1] = arrayPersonne[nb_personnes][nb_attraits+1] + " was very nice with me" 
	textCine[2] = "We went to the park to walk together"
	textCine[3] = "It was such a beautiful moment"
	textCineMid[0] = "My date went very well!"
	textCineMid[1] = arrayPersonne[nb_personnes][nb_attraits+1] + " was very cooperative" 
	textCineMid[2] = "We went to the park for a walk"
	textCineMid[3] = "It was such a beautiful moment"
	textCineFin[0] = "My date went perfectly"
	textCineFin[1] = arrayPersonne[nb_personnes][nb_attraits+1] + " acted as planned"
	textCineFin[2] = "We went to the park like usual"
	textCineFin[3] = "It was such a beautiful moment..."
	textCineFin[4] = "At least for me! Hehehe"
	accident[0] = " perrished in a tragic sinking"
	accident[1] = " choked while drinking wine during our wedding"
	accident[2] = " was found dead in the middle of a dark alleyway"
	accident[3] = ""
	accidentYears[0] = "5 years later"
	accidentYears[1] = "3 years later"
	accidentYears[2] = "2 weeks later"
	accidentYears[3] = "Later that night, I got caught by a police officer and sent to prison"
}

function getJournal(){
	Jscale = 0
	rot = random_range(-15,15)
	if nb_dates = 3{
		rot = random_range(-5,5)
	}
	years = accidentYears[nb_dates]
	acc = nb_dates
	sndPlay = false
}

//music
emitterMainMusic = audio_emitter_create()
wantMusic = true
audio_play_sound_on(emitterMainMusic,snd_music,true,0)

//debug
//screen = 5
//nb_buttons = 0
//button_selected = 0
//nb_dates = 3
//createNewPerson()
//setTextCine()

