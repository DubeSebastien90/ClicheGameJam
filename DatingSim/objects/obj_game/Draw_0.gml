//coeurs
for(var i = 1; i < nb_rows; i++){
	if (i < 5 || i > 7){
		_y[i] += fallSpd*spdDiff[i]
		rot[i] += rotSpd
		if (_y[i] > room_height + 30){
			_y[i] = random_range(-20,-70)
			rot[i] = random_range(0,360)
			rotDir[i] = choose(-1,1)
			spdDiff[i] = random_range(0.8,1.2)
		}
		draw_sprite_ext(spr_coeur,0,i*dist,_y[i],4,4,rot[i]*rotDir[i],c_white,1)
	}
}