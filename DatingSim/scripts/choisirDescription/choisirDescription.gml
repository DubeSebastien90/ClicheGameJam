

function choisirDescription(sexe) constructor{
	var type = choose(0,1,2)
	var description = ""
	//acts
	nb_act = 11
	act[0] = "to play badminton"
	act[1] = "to play football"
	act[2] = "to ski"
	act[3] = "to play tennis"
	act[4] = "cats"
	act[5] = "spagetti"
	act[6] = "to play video games"
	act[7] = "to eat snacks"
	act[8] = "to party"
	act[9] = "meeting people"
	act[10] = "skateboarding"
    //emotions
	nb_emotions = 6
	emotion[0] = "happy"
	emotion[1] = "hungry"
	emotion[2] = "sleepy"
	emotion[3] = "a better person"
	emotion[4] = "calm down"
	emotion[5] = "horny"
	emotion[6] = "fart"
	emotion[7] = "feel great"
	emotion[8] = "sing"
	emotion[9] = "laugh"
	//adjectivs
	nb_adj = 6
	adj[0] = "funny"
	adj[1] = "strange"
	adj[2] = "sad"
	adj[3] = "cool"
	adj[4] = "hot"
	adj[5] = "crunchy"
	//story
	nb_stories = 6
	story[0] = "I haven't graduated from High school"
	story[1] = "I still pee in bed"
	story[2] = "I've been single for 13 years now"
	story[3] = "my cat looks like me"
	story[4] = "I only have 8 toes"
	story[5] = "my bellybutton stinks"
	//people
	nb_ppl = 4
	ppl[0] = "People"
	ppl[1] = "My dad"
	ppl[2] = "My mom"
	ppl[3] = "My friends"
	//something
	nb_smth = 7
	smth[0] = "I'm handsome!"
	smth[1] = "I'm funny as hell"
	smth[2] = "I have a nice butt"
	smth[3] = "I should get in a non-toxic relationship"
	smth[4] = "I'm chill and relax"
	smth[5] = "I should stop being so cool"
	smth[6] = "I should date someone like you ;)"

	if (type = 0){
		description = "I like " + act[round(random_range(-0.49,nb_act-0.51))] + " because it makes me " + emotion[round(random_range(-0.49,nb_emotions-0.51))]
	} else if (type = 1){
		description = "Something " + adj[round(random_range(-0.49,nb_adj-0.51))] + " about me is that " + story[round(random_range(-0.49,nb_stories-0.51))]
	} else if (type = 2){
		description = ppl[round(random_range(-0.49,nb_ppl-0.51))] + " always tell me " + smth[round(random_range(-0.49,nb_smth-0.51))]
	}
	
	
	return description
}