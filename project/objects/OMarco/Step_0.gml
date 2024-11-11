//Windows options

// Trocar o sprite dependendo da arma
switch (global.arma_player_atual){
	case pistola:
		sprite_index = sMarcoPistola
		break
	case ak47:
		sprite_index = sMarcoAK47
		break
}


// O máximo que o player pode chegar
var max_y = y_inicial



if y < y_inicial{
	// SE o y for menor que o y inicial, pulando
	global.pulo = true
}else{
	global.pulo = false
}

if keyboard_check_pressed(vk_f11){
window_set_fullscreen(!window_get_fullscreen());
};


// Atualiza o tempo do tiro
//global.shot_timer -= 0.1; // Diminui o timer a cada passo


//// Troca de arma
//if (global.middle_mouse){ 
//		// Se o indice for menor que o numero total de armas... adicionar mais um no index
//		if global.arma_player_indx < armas_tamanho{
//			global.arma_player_indx += 1
//		}else{
//			global.arma_player_indx = 0	
//		}
//}

//Calculate Movement
var move = global.key_right - global.key_left;

global.hsp_player = move * global.walkspd_player
global.vsp_player = global.vsp_player + global.grv_player;

if(global.key_jump and y >= max_y) {
	global.vsp_player = -17
	
}

if global.key_left
{
    x-=1
	image_xscale = -1
	direction = 180
}

if global.key_right{
	x+=1 
	image_xscale = 1
	direction = 0
}



// Cria instância de bala na camada instances_1 quando clica com botão esquerdo
if (global.left_mouse) {
	switch(global.arma_player_atual){
		case ak47: 
			global.tempo_arma_player_atual = 0.2
			break
		case pistola: 
			global.tempo_arma_player_atual = 0.4
			break
	}
	
	
	// Sistema de tiro refeito
	if global.tempo_jogo - global.ultima_bala >= global.tempo_arma_player_atual * 1000{
		//show_debug_message(string(global.ultima_bala), string(global.tempo_arma_player_atual))
		var bala
		
		bala = instance_create_layer(x, y-(sprite_height/2.5), "Instances", oBala)
		global.ultima_bala = global.tempo_jogo
		
		if !global.key_up and !global.key_down{
			if image_xscale < 0 {
				bala.direction = 180
			}
			else {	
				bala.direction = 0
			}
		}
		else if global.key_up and global.key_left{
			bala.direction = 155
			bala.image_angle = 155
		}
		else if global.key_up and global.key_right{
			bala.direction = 25
			bala.image_angle = 25
		}
		else{
			if global.key_up{
				bala.direction = 90
				bala.image_angle = 90
			}
			
			else if global.key_down and global.pulo{
				bala.direction = -90
				bala.image_angle = -90
			}
			else if global.key_down{
				if image_xscale < 0{
					bala.direction = 180 
				}
				else{
					bala.direction = 0 
				}
			}
		}
	}
		
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



y = y + global.vsp_player;


// Voltar para o y inicial
if (y > y_inicial){
	// Diminuir o y gradativamente até chegar em y_inicial
	//y -= global.vsp_player
	global.vsp_player = 17
	
	y = y_inicial
	//global.pulo = false // Significa que o player chegou no chão
}

// Vertical Limit - Prevents crossing top and bottom edges
//if (y - half_height < 0) {
//    y = half_height; // Top edge limit
//} 
//else if (y + half_height > room_height) {
//    y = room_height - half_height; // Bottom edge limit
//}


//Vertical Collision
/*
if (place_meeting(x, y+global.vsp_player, oCenario)){
	while(!place_meeting(x, y+sign(global.vsp_player), oCenario)){
		y = y + sign(global.vsp_player);
	}
	
	global.vsp_player = 0;
}
*/

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


