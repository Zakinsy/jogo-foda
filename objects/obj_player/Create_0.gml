event_inherited();

//moviment
move_spd = 0;
move_spd_max = 15;
move_spd_walk = 0;
acc = .1;	
dcc = .3;

//jump
jump_height = 60; //50
jump_max = 2;
jump_count = jump_max;
coyote_time = 0;
coyote_time_max = 5;
air = false;

state = player_state_free;