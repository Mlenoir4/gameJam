
var near = layer_get_id("Background_1")
var distant = layer_get_id("Background_2")
var far = layer_get_id("Background_3")

layer_y(near, lerp(0, camera_get_view_y(view_camera[0]), 0.1));
layer_y(distant, lerp(0, camera_get_view_y(view_camera[0]), 0.2));
layer_y(far, lerp(0, camera_get_view_y(view_camera[0]), 0.3));