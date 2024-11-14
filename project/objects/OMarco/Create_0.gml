
// Se a sala atual for uma das salas de gameplay
if array_contains(global.salas_gameplay, room){
	fundo = audio_play_sound(background, 1, true)
}else if array_contains(global.salas_fim, room){
	fundo = audio_play_sound(bosstheme, 1, true)
}


/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

y_inicial = y

// define se é possivel colidir com o objeto de queda ou não (apenas na sala)
colidir_queda = true
hp_tempo = global.hp_tempo // Variavel local para não interferir na global


/*
hsp = global.hsp_player;
vsp = global.vsp_player;
grv = 0.75;
walkspd = 4;

shot_timer = 0; // Inicializa o timer
vida = global.vida_player; // Inicializa a saúde do inimigo*/
