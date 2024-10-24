function player_state_free()
{
	var jump = keyboard_check_pressed(ord("W"));
	var left = keyboard_check(ord("A"));
	var down = keyboard_check(ord("S"));
	var right = keyboard_check(ord("D"));

	var move = right - left != 0;

	if (move)
	{
		sprite_index = spr_lili_walking;
		move_dir = point_direction(0, 0, right-left, 0);
		move_spd = approach(move_spd, move_spd_max, acc);
	}
	else
	{
		sprite_index = spr_lili_idle;
		move_spd = approach(move_spd, 0, dcc);
	}

	can_move = approach(can_move,0,.5);
	
	if(can_move <= 0) 
		hspd = lengthdir_x(move_spd,move_dir);

	if(hspd != 0)
	{
		x_scale = sign(hspd);
	}
	
	ground = place_meeting(x,y+1,obj_wall);

	if(!ground)
	{
		if(vspd < 0)
		{
			sprite_index = spr_player_jumping;	
		}
		else if(vspd > 0)
		{
			sprite_index = spr_player_falling;
		}
	}

	if(jump && ground)
	{
		vspd = 0;
		vspd -= jump_height;
	}	
	
	if (down)
	{
		obj_one_way.sprite_index = -1;
	}
}

function player_state_stop()
{
	ground = place_meeting(x,y+1,obj_wall);
	
	if (ground)
	{
		hspd = 0;
	}
	else 
	{
		sprite_index = spr_lili_idle;
		move_spd = approach(move_spd, 0, dcc);
	}
}