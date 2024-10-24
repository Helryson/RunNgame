//Windows options
if keyboard_check_pressed(vk_f11){
window_set_fullscreen(!window_get_fullscreen())	
}

//Get Player Input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

//Calculate Movement
var move = key_right - key_left;

hsp = move * walkspd
vsp = vsp + grv;

if(place_meeting(x, y+1, oCenario)) && (key_jump) {
	vsp = -17
}

if key_left
{
    x-=1 image_xscale=-1
}


//Horizontal Collision
if (place_meeting(x+hsp, y, Object3)){
	while(!place_meeting(x+sign(hsp), y, Object3)){
		x = x + sign(hsp);
	}
	
	hsp = 0;
}
x = x + hsp;

//Vertical Collision
if (place_meeting(x, y+vsp, oCenario)){
	while(!place_meeting(x, y+sign(vsp), oCenario)){
		y = y + sign(vsp);
	}
	
	vsp = 0;
}
y = y + vsp;