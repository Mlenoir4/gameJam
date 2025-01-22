var platform_width = 100;
var platform_height = 20;
var spacing = 100;

for (y = room_height; y > 0; y -= spacing) {
    x = irandom_range(0, room_width - platform_width);
    instance_create_layer(x, y, "Platforms", Obj_plateforme);
}
