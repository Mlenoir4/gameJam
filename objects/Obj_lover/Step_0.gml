//set victory

if (place_meeting(x,y, Obj_player)){
	audio_play_sound(victory,0,false)
	audio_sound_gain(victory, 1, 0)
	instance_destroy()
}