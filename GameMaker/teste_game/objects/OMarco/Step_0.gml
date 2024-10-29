//Windows options
if keyboard_check_pressed(vk_f11){
window_set_fullscreen(!window_get_fullscreen());
};

//Get Player Input
var key_left = keyboard_check(ord("A"));
var key_right = keyboard_check(ord("D"));
var key_jump = keyboard_check_pressed(vk_space);
var left_mouse = mouse_check_button_pressed(mb_left);

//Cria instância de bala na camada instances_1 quando clica com botão esquerdo
if (left_mouse) {
    var proj = instance_create_layer(x+16, y, "Instances_1", oBala);
    proj.direction = direction; // Define a direção do projétil, se necessário
}

//Calculate Movement
var move = key_right - key_left;

hsp = move * walkspd
vsp = vsp + grv;

if(place_meeting(x, y+1, oCenario)) && (key_jump) {
	vsp = -17
}

if key_left
{
    x-=1
	image_xscale = -0.2
	direction = 180
}

if key_right{
	x+=1 
	image_xscale = 0.2
	direction = 0
}


//Horizontal Collision
if (place_meeting(x+hsp, y, Object3)){
	while(!place_meeting(x+sign(hsp), y, Object3)){
		x = x + sign(hsp);
	}
	
	hsp = 0;
}
x = x + hsp;

// Define o meio do sprite para verificar os limites
var half_width = sprite_width / 2;
var half_height = sprite_height / 2;

// Limite Horizontal - Impede ultrapassar as bordas esquerda e direita
if (x - half_width < 0) {
    x = half_width; // Limite da borda esquerda
} 
else if (x + half_width > room_width) {
    x = room_width - half_width; // Limite da borda direita
}


//Vertical Collision
if (place_meeting(x, y+vsp, oCenario)){
	while(!place_meeting(x, y+sign(vsp), oCenario)){
		y = y + sign(vsp);
	}
	
	vsp = 0;
}
y = y + vsp;

