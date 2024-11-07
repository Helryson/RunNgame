// Se o player colidir com o objeto de queda, ele vai cair

if other.colidir_queda{
	alarm[0] = 10
	colidiu_player = true
	if (!global.key_jump){
		other.y_inicial += global.gravidade
	}else{
		other.y_inicial -= global.gravidade
	}
}