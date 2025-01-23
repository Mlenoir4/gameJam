// Calculer les coordonnées dans le tileset
var src_x = current_frame * frame_width;
var src_y = current_row * frame_height;

// Dessiner la section correspondante
draw_sprite_part(player1, 0, src_x, src_y, frame_width, frame_height, x, y);

