// Paramètres du niveau
var level_width = 1000;
var level_height = 8700;
var max_platform_height = 200;
var min_gap = 50;
var max_gap = 100;
var max_platform_width = 100;
var min_platform_width = 50;

randomize();


// Initialisation du placement des plateformes
var y_position = level_height;
var platform_count = 0;

// Générer les plateformes
while (y_position > max_platform_height) {
    var platform_width = random_range(min_platform_width, max_platform_width);
    var x_position = random_range(0, level_width - platform_width);

    var platform = instance_create_layer(x_position, y_position, "Instances", Obj_plateforme);

    platform.image_xscale = 5;

    y_position -= irandom_range(min_gap, max_gap);


    platform_count += 1;
}

// Ajouter une plateforme de sol pour la stabilité du niveau
var platform1 = instance_create_layer(0, level_height, "Instances", Obj_plateforme);
platform1.image_xscale = 3;

var platform2 = instance_create_layer(level_width , level_height, "Instances", Obj_plateforme);
platform2.image_xscale = 3;