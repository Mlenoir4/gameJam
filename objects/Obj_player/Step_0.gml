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
// --- INPUTS ---
// Récupère les entrées clavier
rightKey = keyboard_check(ord("D"));
leftKey = keyboard_check(ord("Q"));
jumpKeyPressed = keyboard_check(vk_space);
RunningKeyPressed = keyboard_check(vk_shift);

// Détermine la direction de déplacement horizontal
moveDir = rightKey - leftKey;

// --- DÉPLACEMENT HORIZONTAL ---
if (keyboard_check(vk_shift)) {
    xspd = moveDir * runSpd;
} else {
    xspd = moveDir * moveSpd;
}

var _subPixel = 0.5;
if (place_meeting(x + xspd, y, Obj_plateforme)) {
    var _pixelCheck = _subPixel * sign(xspd);
    while (!place_meeting(x + _pixelCheck, y, Obj_plateforme)) {
        x += _pixelCheck;
    }
    xspd = 0;
}
x += xspd;

// --- DÉPLACEMENT VERTICAL ---
yspd += grav;

if (jumpKeyPressed && place_meeting(x, y + 1, Obj_plateforme)) {
    yspd = jspd;
}

var _subPixel = 0.5;
if (place_meeting(x, y + yspd, Obj_plateforme)) {
    var _pixelCheck = _subPixel * sign(yspd);
    while (!place_meeting(x, y + _pixelCheck, Obj_plateforme)) {
        y += _pixelCheck;
    }
    yspd = 0;
}
y += yspd;

// --- LOGIQUE D'ÉTATS ---
switch (state) {
    case State.Idle:
		max_frame = 2
        current_row = 24
        if (moveDir != 0) {
            state = State.Walking;
        }
        break;

    case State.Walking:
	show_debug_message("walking")

        if (moveDir == 0) {
            state = State.Idle;
        }


        if (!place_meeting(x, y + 1, Obj_plateforme)) {
            state = State.Jumping;
        }
		
		show_debug_message(moveDir)

        if (moveDir < 0) {current_row = 9; max_frame = 9};
        if (moveDir > 0) {current_row = 11; max_frame = 9};
        break;

    case State.Jumping: 
		show_debug_message("jumping")
        current_row = 26
		max_frame = 5

        if (place_meeting(x, y + 1, Obj_plateforme)) {
            if (moveDir == 0) state = State.Idle;
            else state = State.Walking;
        }
        break;

    default:
        state = State.Idle;
        break;
}

// Avancer l'animation
animation_timer += animation_speed;

if (animation_timer >= 1) {
    animation_timer = 0;
    current_frame += 1;

    if (current_frame >= max_frame) {
        current_frame = 0;
    }
}

