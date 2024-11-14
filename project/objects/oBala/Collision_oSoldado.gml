// Soldado mais perto
var soldado = other
// Tira 1 de vida do alvo
soldado.vida -= global.dano_armas[array_get_index(global.armas, global.arma_player_atual)]

// Destruir a instância da bala em caso de colisão
instance_destroy()
