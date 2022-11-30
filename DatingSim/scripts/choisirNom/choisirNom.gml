function choisirNom(sexe) constructor{
	var nom = ""
	if(sexe = 0){
		nb_noms = 20
		noms[0] = "Jason"
		noms[1] = "Michael"
		noms[2] = "George"
		noms[3] = "Fabio"
		noms[4] = "Karlson"
		noms[5] = "Sebastian"
		noms[6] = "Kyle"
		noms[7] = "Ricardo"
		noms[8] = "Richard"
		noms[9] = "Charles"
		noms[10] = "Kevin"
		noms[11] = "John"
		noms[12] = "Gregory"
		noms[13] = "Anthony"
		noms[14] = "Philippes"
		noms[15] = "Nathan"
		noms[16] = "Flynn"
		noms[17] = "Jacob"
		noms[18] = "Noah"
		noms[19] = "Jeremy"
		nom = noms[round(random_range(-0.49,nb_noms-0.51))]
	} else{
		nb_noms = 20
		noms[0] = "Sabrina"
		noms[1] = "Natasha"
		noms[2] = "Michelle"
		noms[3] = "Simone"
		noms[4] = "Jennifer"
		noms[5] = "Ashley"
		noms[6] = "Katty"
		noms[7] = "Megan"
		noms[8] = "Claire"
		noms[9] = "Leah"
		noms[10] = "Penny"
		noms[11] = "Nancy"
		noms[12] = "Samantha"
		noms[13] = "Betthany"
		noms[14] = "Malory"
		noms[15] = "Franceska"
		noms[16] = "Karen"
		noms[17] = "Amanda"
		noms[18] = "Maddison"
		noms[19] = "Blaire"
		nom = noms[round(random_range(-0.49,nb_noms-0.51))]
	}
	return nom
}