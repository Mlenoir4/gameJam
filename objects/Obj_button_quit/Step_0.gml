/// Vérifie si la souris est sur le bouton
is_hovered = point_in_rectangle(mouse_x, mouse_y, x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2);

if (is_hovered) {
    if (mouse_check_button(mb_left)) {
        is_clicked = true;
    } else {
        is_clicked = false;
    }
} else {
    is_clicked = false;
}

/// Action en cas de clic
if (is_clicked && mouse_check_button(mb_left)) {
    if (object_index == Obj_button_play) {
        room_goto_next();
    }
    if (object_index == Obj_button_quit) {
        game_end();
    }
}