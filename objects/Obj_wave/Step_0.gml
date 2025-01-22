y -= wave_speed;

if (place_meeting(x, y, Obj_player)) {
    show_message("Game Over!");
	instance_destroy();
	
}

if (y < -sprite_height) {
    instance_destroy();
}
