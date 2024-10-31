// Esse alarme é ativado depois de um tempo para desativar a colisão

//PLayer mais proximo
var player_prox = instance_nearest(x, y, OMarco)

// SE o player colidiu
if (colidiu_player){
	player_prox.colidir_queda = false
}
