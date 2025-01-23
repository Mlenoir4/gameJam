if (place_meeting(x,y, Obj_player) && !collected){
	Obj_wave.heart_bonus++;
	Obj_wave.heart_bonus_total++;
	audio_play_sound(bonus_take,0,false)
	audio_sound_gain(bonus_take, 1, 0)
	instance_destroy()
}