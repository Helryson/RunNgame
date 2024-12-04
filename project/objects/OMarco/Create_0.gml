
// Se a sala atual for uma das salas de gameplay
if array_contains(global.salas_gameplay, room){
	fundo = audio_play_sound(background, 1, true)
}else if array_contains(global.salas_fim, room){
	fundo = audio_play_sound(bosstheme, 1, true)
}else if array_contains(global.salas_navio, room){
	fundo = audio_play_sound(nvaio, 1, true)
}


/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

centro_gravitacional = instance_nearest(x, y, oCentroGravitacional)
y_inicial = centro_gravitacional.y
y_inicial_o = centro_gravitacional.y
sprite_atual = sprite_index

// define se é possivel colidir com o objeto de queda ou não (apenas na sala)
colidir_queda = true
hp_tempo = global.hp_tempo // Variavel local para não interferir na global
hp_recover = global.tempo_recover
id_plataforma = 0 // O id da possivel plataforma que o objeto ta tocando


/*
hsp = global.hsp_player;
vsp = global.vsp_player;
grv = 0.75;
walkspd = 4;

shot_timer = 0; // Inicializa o timer
vida = global.vida_player; // Inicializa a saúde do inimigo*/
