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

// Pega um sprite da lista de corações
coracao.sprite_index = coracoes[int64(global.vida_player/100)]

/*
switch(global.vida_player) {
    case 6: coracao.sprite_index = coracao1; break;
    case 5: coracao.sprite_index = coracao2; break;
    case 4: coracao.sprite_index = coracao3; break;
    case 3: coracao.sprite_index = coracao4; break;
    case 2: coracao.sprite_index = coracao5; break;
    case 1: coracao.sprite_index = coracao6; break;
    case 0: coracao.sprite_index = coracao7; break;
}
*/

// Spawnar armas aleatoriamente (Uma de cada vez!)
if instance_number(oArma) <= 0{
	var xAleatorio = irandom_range(0, room_width)
	instance_create_layer(xAleatorio, 0, "Main_Layer", oArma)
}


