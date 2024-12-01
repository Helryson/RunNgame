// Soldado mais perto
var chefao = other;
// Tira 1 de vida do alvo

switch global.arma_player_atual {
    case pistola:
        chefao.vida -= global.dano_armas[0];
        break;

    case ak47:
        chefao.vida -= global.dano_armas[1];
        break;

    case shotgun:
        if x >= boss_x+256 or x <= boss_x-256 {
		    chefao.vida -= global.dano_armas[2][0];
		} else if x >= boss_x+128 or x <= boss_x-128 {
		    chefao.vida -= global.dano_armas[2][1];
		} else if x >= boss_x+64 or x <= boss_x-64 {
		    chefao.vida -= global.dano_armas[2][2];
		} else if x >= boss_x+32 or x <= boss_x-32 {
		    chefao.vida -= global.dano_armas[2][3];
		}

        break;
}

// Exibe a vida restante do chefão no console de depuração
show_debug_message(chefao.vida);

// Atualiza o sprite do chefão para mostrar dano
if chefao.vida > 0{
	chefao.sprite_index = sMechaDano;
}

// Destruir a instância da bala em caso de colisão
instance_destroy();
