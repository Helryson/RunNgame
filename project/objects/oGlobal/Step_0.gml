// INstancia de coração mais proxima
var coracao = instance_nearest(x, y, oCoracao)
global.tempo_jogo = current_time

// Tempo de invencibilidade no player
if global.tempo_jogo <= global.tempo_invencibilidade_player{
	global.invencibilidade_player= true
}else{
	global.invencibilidade_player = false
}

//Get Player Input
global.key_left = keyboard_check(ord("A"));
global.key_right = keyboard_check(ord("D"));
global.key_jump = keyboard_check_pressed(vk_space);
global.left_mouse = mouse_check_button(mb_left);
global.key_up = keyboard_check(ord("W"))
global.key_down = keyboard_check(ord("S"))


global.key_jump2 = keyboard_check_direct(vk_space)
// Player mais proximo
var player_proximo = instance_nearest(x, y, OMarco)

// Lista de corações
var coracoes = [coracao7, coracao6, coracao5, coracao4, coracao3, coracao2, coracao1]

var vida_porcentagem = (global.vida_player /global.originais[0]) * 100;

// Calcula o índice com base na porcentagem
var indice = floor((vida_porcentagem / 100) * array_length(coracoes));
indice = clamp(indice, 0, array_length(coracoes) - 1);

show_debug_message(string(vida_porcentagem))

oCoracao.sprite_index = coracoes[indice];


// Spawnar armas aleatoriamente (Uma de cada vez!)
if instance_number(oArma) <= 0{
	if room == bossfight{
		var xAleatorio = irandom_range(32, 960)
		instance_create_layer(xAleatorio, 0, "Main_Layer", oArma)
	}else{
		var xAleatorio = irandom_range(0, room_width)
		instance_create_layer(xAleatorio, 0, "Main_Layer", oArma)
	}
}

if instance_nearest(x, y, oTextBox){
	global.is_dialog_active = false
}
else{
	global.is_dialog_active = false
}