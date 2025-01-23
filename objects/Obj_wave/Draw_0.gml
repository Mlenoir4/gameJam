var lerp_amount = abs(sin(current_time / 1000));
draw_primitive_begin(pr_trianglestrip);

for (var i = 0; i <= room_width; i += 40) 
{
    var wave_y = y + lerp(sin(current_time / 100 + i) * 18, 0, lerp_amount);

    draw_vertex_colour(x + i, wave_y, c_blue, 1.0);

    draw_vertex_colour(x + i, room_height, c_blue, 1.0);
}

draw_primitive_end();