


wave_speed = wave_speed - (heart_bonus * 0.02)
heart_bonus = 0
y -= wave_speed;

if (place_meeting(x, y, Obj_player)) {
	audio_play_sound(death,0,false)
	audio_sound_gain(death, 1, 0)
    show_message("Game Over!");
	instance_destroy();
	room_goto_previous()
	
}

if (y < -sprite_height) {
    instance_destroy();
}
