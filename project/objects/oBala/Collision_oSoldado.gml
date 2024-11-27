// Soldado mais perto
var soldado = other;
// Tira 1 de vida do alvo

switch global.arma_player_atual {
    case pistola:
		var som_tiro = pistola_tiro
        soldado.vida -= global.dano_armas[0];
        // Reproduz o som de tiro para a pistola
        audio_play_sound(som_tiro, 1, false);  // 1 é o volume e 'false' indica que o som não se repete
        break;

    case ak47:
        soldado.vida -= global.dano_armas[1];
        // Reproduz o som de tiro para a AK47
        audio_play_sound(som_tiro_ak47, 1, false);  // Troque por um som específico para a AK47
        break;

    case shotgun:
        if x >= soldado_x + 256 or x <= soldado_x - 256 {
            soldado.vida -= global.dano_armas[2][0];
            // Reproduz o som para o tiro da shotgun com maior dano
            audio_play_sound(som_tiro_shotgun_1, 1, false);
        } else if x >= soldado_x + 128 or x <= soldado_x - 128 {
            soldado.vida -= global.dano_armas[2][1];
            // Reproduz o som para o tiro da shotgun com dano médio
            audio_play_sound(som_tiro_shotgun_2, 1, false);
        } else if x >= soldado_x + 64 or x <= soldado_x - 64 {
            soldado.vida -= global.dano_armas[2][2];
            // Reproduz o som para o tiro da shotgun com dano baixo
            audio_play_sound(som_tiro_shotgun_3, 1, false);
        } else if x >= soldado_x + 32 or x <= soldado_x - 32 {
            soldado.vida -= global.dano_armas[2][3];
            // Reproduz o som para o tiro da shotgun com dano mínimo
            audio_play_sound(som_tiro_shotgun_4, 1, false);
        }
        break;
}


soldado.sprite_index = sSoldadoDano
soldado.dano = true

// Destruir a instância da bala em caso de colisão
instance_destroy()
