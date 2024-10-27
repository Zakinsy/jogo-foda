function controls(){
	jump = keyboard_check_pressed(ord("W"));
	left = keyboard_check(ord("A"));
	down = keyboard_check(ord("S"));
	right = keyboard_check(ord("D"));
}

function player_state_free()
{
	controls();

	#region Moviment
	
	var move = right - left != 0;

	if (move){
		if (hspd == move_spd_max*sign(hspd)){
			sprite_index = spr_shadow_run;
		} else {
			sprite_index = spr_shadow_walk;
		}
		
		move_dir = point_direction(0, 0, right-left, 0);
		move_spd = approach(move_spd, move_spd_max, acc);
	} else {
		if (hspd != 0){
			sprite_index = spr_shadow_stoping;
		} else {
			sprite_index = spr_shadow_idle;
		}
		move_spd = approach(move_spd, 0, dcc);
	}
	
	hspd = lengthdir_x(move_spd,move_dir);

	if(hspd != 0)
	x_scale = sign(hspd);
		
		
	#endregion
	
	#region Jump
	
	var ground = place_meeting(x,y+1,obj_wall);
	
	if(ground){
		jump_count = jump_max;          //reseta a quantidade de pulos do player
		coyote_time = coyote_time_max;  //reseta o coyote time
		air = false;                    //reseta o air
	}else{
		coyote_time--; //coyote time começa a descer
		
		if(vspd < 0){              //se eu tiver subindo
			if (!air){             //se o air for falso
				image_index = 0;   //reseta a animação do sprite
				air = true;        //torna o air falso para a condição
			}
			
			if(jump_count == 1){                                           //se eu pular uma vez
				sprite_index = spr_shadow_jump;	                           //sprite pulando normal
				
				if (image_index >= sprite_get_number(spr_shadow_jump)-1){
					image_index = sprite_get_number(spr_shadow_jump)-1;
				}
			}else{                                                //se eu pular duas vezes
				if (hspd == move_spd_max*sign(hspd)){    
					screen_shake(100, 1);                         
					sprite_index = spr_shadow_double_jump_fast;
				}else{
					sprite_index = spr_shadow_double_jump_low;
				}
			}
		}
		else if(vspd > 0){
			if (!air){
				image_index = 0;
				air = true;
			}
			
			if (jump_count == 0){
				if (hspd == move_spd_max*sign(hspd)){
					sprite_index = spr_shadow_double_jump_fast;
				}else{
					sprite_index = spr_shadow_double_jump_low;
				}
			}else{
				sprite_index = spr_shadow_fall;
				
				if (image_index >= sprite_get_number(spr_shadow_fall)-1){
					image_index = sprite_get_number(spr_shadow_falling)-1;
				}
			}
		}
	}

	if(jump && coyote_time > 0 || jump && jump_count > 0){
		jump_count--;
		coyote_time = 0;
		vspd = 0;
		vspd -= jump_height;
	} else if (jump_count == 0){
		hspd *= 2;
	}
	#endregion
	
	#region OneWay
	if (down && instance_exists(obj_one_way)){
		obj_one_way.sprite_index = -1;
	}
	#endregion
}