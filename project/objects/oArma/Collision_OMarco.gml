// Se o player colidir com a arma, é para coletar
global.arma_player_atual = arma_atual

switch arma_atual{
	case ak47:
	global.num_balas_player = 90
	break
	
	case shotgun:
	global.num_balas_player = 18
}

instance_destroy()