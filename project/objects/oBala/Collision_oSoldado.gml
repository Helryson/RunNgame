// Soldado mais perto
var soldado = other
// Tira 1 de vida do alvo

switch global.arma_player_atual {
    case pistola:
        soldado.vida -= global.dano_armas[0];
        break;

    case ak47:
        soldado.vida -= global.dano_armas[1];
        break;

    case shotgun:
        if x >= soldado_x+256 or x <= soldado_x-256 {
		    soldado.vida -= global.dano_armas[2][0];
		} else if x >= soldado_x+128 or x <= soldado_x-128 {
		    soldado.vida -= global.dano_armas[2][1];
		} else if x >= soldado_x+64 or x <= soldado_x-64 {
		    soldado.vida -= global.dano_armas[2][2];
		} else if x >= soldado_x+32 or x <= soldado_x-32 {
		    soldado.vida -= global.dano_armas[2][3];
		}

        break;
}

soldado.sprite_index = sSoldadoDano
soldado.dano = true

// Destruir a instância da bala em caso de colisão
instance_destroy()
