width = 640
height = 360
cam_spd = .2

window_set_fullscreen(true);
global.view_target = obj_player;
window_set_size(width, height);
surface_resize(application_surface, width, height);
alarm[0] = 1;

shake_legnth = 0;
shake_time = 0;