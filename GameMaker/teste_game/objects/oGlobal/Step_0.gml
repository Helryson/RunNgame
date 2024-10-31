// INstancia de coração mais proxima
var coracao = instance_nearest(x, y, oCoracao)

//Get Player Input
global.key_left = keyboard_check(ord("A"));
global. key_right = keyboard_check(ord("D"));
global.key_jump = keyboard_check_pressed(vk_space);
global.left_mouse = mouse_check_button(mb_left);


// Lista de corações
var coracoes = [coracao7, coracao6, coracao5, coracao4, coracao3, coracao2, coracao1]

// Pega um spprite da lista de corações
coracao.sprite_index = coracoes[global.vida_player]

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