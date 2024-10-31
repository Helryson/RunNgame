//Windows options

// O máximo que o player pode chegar
var max_y = y_inicial / global.max_playerY

show_debug_message(string(max_y)+", "+string(y))

if keyboard_check_pressed(vk_f11){
window_set_fullscreen(!window_get_fullscreen());
};

//Get Player Input
var key_left = keyboard_check(ord("A"));
var key_right = keyboard_check(ord("D"));
var key_jump = keyboard_check_pressed(vk_space);
var left_mouse = mouse_check_button(mb_left);

// Atualiza o tempo do tiro
global.shot_timer -= 1 / room_speed; // Diminui o timer a cada passo

// Cria instância de bala na camada instances_1 quando clica com botão esquerdo
if (left_mouse) {
    if (global.shot_timer <= 0) { // Verifica se é hora de disparar
        var proj = instance_create_layer(x + 16, y, "Instances_1", oBala);
        proj.direction = direction; // Define a direção do projétil
        global.shot_timer = 0.2; // Reseta o timer para o próximo disparo
    }
}
//Calculate Movement
var move = key_right - key_left;

global.hsp_player = move * global.walkspd_player
global.vsp_player = global.vsp_player + global.grv_player;

if(key_jump and y >= max_y) {
	global.vsp_player = -17
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
/* if (place_meeting(x+hsp, y, Object3)){
	while(!place_meeting(x+sign(hsp), y, Object3)){
		x = x + sign(hsp);
	}
	
	hsp = 0;
}*/
x = x + global.hsp_player;

// Define o meio do sprite para verificar os limites
var half_width = sprite_width / 2;
var half_height = sprite_height / 2;

// Limite Horizontal - Impede ultrapassar as bordas esquerda e direita
/* Horizontal Limit - Prevents crossing left and right edges
if (x - half_width < 0) {
    x = half_width; // Left edge limit
} 
else if (x + half_width > room_width) {
    x = room_width - half_width; // Right edge limit
}

*/

// Se o x for >= que room_width, ir pra proxima "sala"

if x >= room_width{
	if room != room_last{
		room_goto_next()
	}else{
		x = room_width
	}
}

// Se o x <= 0, sala anterior
if x <= 0{
	if room != room_first{
		room_goto_previous()
	}else{
		x = 0
	}
}


//Vertical Collision
/*
if (place_meeting(x, y+global.vsp_player, oCenario)){
	while(!place_meeting(x, y+sign(global.vsp_player), oCenario)){
		y = y + sign(global.vsp_player);
	}
	
	global.vsp_player = 0;
}*/
y = y + global.vsp_player;

// Vertical Limit - Prevents crossing top and bottom edges
if (y - half_height < 0) {
    y = half_height; // Top edge limit
} 
else if (y + half_height > room_height) {
    y = room_height - half_height; // Bottom edge limit
}

// Colisão com a bala
/*if (place_meeting(x, y, oBalaInimigo)) {
    var bala = instance_place(x, y, oBalaInimigo); // Encontra a bala em colisão
    if (bala != noone) {
        vida -= 1; // Reduz a saúde do inimigo
        
        // Altera o sprite baseado na vida restante
*/        


// Se o player morrer, acabou
if global.vida_player <= 0{
	instance_destroy()
}

