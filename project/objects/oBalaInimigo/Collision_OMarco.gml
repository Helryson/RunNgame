// player mais proximo

if !global.invencibilidade_player{
	if instance_exists(atirador){
		global.vida_player -= atirador.dano_player
		global.player_danificado = true
	}else{
		instance_destroy()
	}
}
instance_destroy()