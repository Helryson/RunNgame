// player mais proximo

if !global.invencibilidade_player{
	if instance_exists(atirador){
		global.vida_player -= atirador.dano_player
	}else{
		instance_destroy()
	}
}
instance_destroy()