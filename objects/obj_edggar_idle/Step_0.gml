/// @desc Core Player Logic

//Get Player Inputs
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

//calculate Movement
var _move = key_right - key_left;

hsp = _move * walksp;

vsp = vsp + grv;

if (place_meeting(x,y+1,obj_invisible_wall)) && (key_jump)
{
	vsp = -jumpsp	
}

//Horizontal Collision
if (place_meeting(x+hsp,y,obj_invisible_wall))
{
	while (!place_meeting(x+sign(hsp),y,obj_invisible_wall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,obj_invisible_wall))
{
	while (!place_meeting(x,y+sign(vsp),obj_invisible_wall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

//Animation
if (!place_meeting(x,y+1,obj_invisible_wall))
{
	sprite_index = spr_edggar_jump;


	// Are we jumping?
	if (vsp < -0.5) {
		image_index = 1;
	}
	// Are we at the top of the jump?
	else if (vsp >= -4.5 && vsp <= 4.5) {
		image_index = 2;
	}
	// Are we falling?
	else if (vsp > 0.5) {
		image_index = 3;	
	}
}
else
{
	if (hsp == 0)
	{
		sprite_index = spr_edggar_idle;	
	}
	else
	{
		sprite_index = spr_edggar_walk;	
	}
}

if (hsp != 0) image_xscale = sign(hsp);