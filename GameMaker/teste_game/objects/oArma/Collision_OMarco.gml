// Se o player colidir com a arma, é para coletar

var tamanho_array = array_length(global.armas_player) // Tamanho do array de armas

// Se o player já não tiver a arma
if !array_contains(global.armas_player, sprite_index){
	// Isso pega o ultimo indice
	array_push(global.armas_player, sprite_index);
	array_push(global.tempo_tiro_arma_player, (arma, arma.tempo))//global.armas_tempo_player[tamanho_array] = global.armas[arma] // Coloca o tempo no index do player
}

instance_destroy()
