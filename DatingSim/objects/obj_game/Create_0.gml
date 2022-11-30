nb_rows = 12
dist = room_width/nb_rows
fallSpd = 0.4
rotSpd = 0.1
for(var i = 1; i < nb_rows; i++){
	_y[i] = random_range(-70,room_height)
	rot[i] = random_range(0,360)
	rotDir[i] = choose(-1,1)
	spdDiff[i] = random_range(0.8,1.2)
}

mainEmitter = audio_emitter_create()
otherEmitter = audio_emitter_create()

function playSound(snd,pitchVar) constructor{
	audio_emitter_pitch(mainEmitter,random_range(1.5-pitchVar,1.5+pitchVar))
	audio_play_sound_on(mainEmitter,snd,false,1)
}

function playSound2(snd) constructor{
	audio_play_sound_on(otherEmitter,snd,false,1)
}