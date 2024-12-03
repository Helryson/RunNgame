if !global.invencibilidade_player{
	if instance_exists(atirador){
		global.vida_player -= atirador.dano_player+2
		global.player_danificado = true
		
		// Troca o sprite do player para o de dano
		other.sprite_index = sMarcoDano
	}else{
		instance_destroy()
	}
}
instance_destroy()