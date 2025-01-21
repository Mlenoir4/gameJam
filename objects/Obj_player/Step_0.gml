// Centrer la caméra sur le joueur
var camera_id = view_camera[0]; // Récupère la caméra associée à Viewport 0
camera_set_view_pos(camera_id, x - camera_get_view_width(camera_id) / 2, y - camera_get_view_height(camera_id) / 2);


// Suivi fluide de la caméra
var target_x = x - camera_get_view_width(camera_id) / 2;
var target_y = y - camera_get_view_height(camera_id) / 2;

// Position actuelle de la caméra
var cam_x = camera_get_view_x(camera_id);
var cam_y = camera_get_view_y(camera_id);

// Interpolation vers la position cible
var smooth_factor = 0.1;
cam_x = lerp(cam_x, target_x, smooth_factor);
cam_y = lerp(cam_y, target_y, smooth_factor);

// Limites de la room
var room_left = 0;
var room_top = 0;
var room_right = room_width - camera_get_view_width(camera_id);
var room_bottom = room_height - camera_get_view_height(camera_id);

// Appliquer les limites
cam_x = clamp(cam_x, room_left, room_right);
cam_y = clamp(cam_y, room_top, room_bottom);

// Mettre à jour la position de la caméra
camera_set_view_pos(camera_id, cam_x, cam_y);


//////////////////////////

// Variables de base
speed = 4;
var jump_speed = -20;
gravity = 0.5;
var max_fall_speed = 10;


if (keyboard_check(vk_left) || keyboard_check(ord("Q"))) {
    x -= speed;
}
if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
    x += speed;
}

// Appliquer la gravité
if (!place_meeting(x, y + 1, Obj_plateforme)) { 
    vspeed += gravity;
    if (vspeed > max_fall_speed) {
        vspeed = max_fall_speed;
    }
} else {
    vspeed = 0;
}

// Gestion du saut
if (keyboard_check_pressed(vk_space) && place_meeting(x, y + 1, Obj_plateforme)) {
    vspeed = jump_speed;
}

// Appliquer le mouvement vertical
y += vspeed;

// Empêcher les collisions avec les plateformes
if (place_meeting(x, y, Obj_plateforme)) {
    while (place_meeting(x, y, Obj_plateforme)) {
        y -= sign(vspeed);
    }
    vspeed = 0;
}
