/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
speed = 7
direction = 0; // Inicializa a direção
id_plataforma = 0 // O id da possivel plataforma que o objeto ta tocando
id_pedra = 0 // o id da possivel pedra que o objeto colidir


switch global.arma_player_atual {
    case pistola:
        // Reproduz o som de tiro para a pistola
        audio_play_sound(pistola_tiro, 1, false);  // 1 é o volume e 'false' indica que o som não se repete
        break;

    case ak47:
        // Reproduz o som de tiro para a AK47
        audio_play_sound(pistola_tiro, 1, false);  // Troque por um som específico para a AK47
        break;

    case shotgun:
        audio_play_sound(pistola_tiro, 1, false);
        break;
}


// Localiza o boss mais próximo
boss = instance_nearest(x, y, oBoss);

// Verifica se o boss existe
if (boss != noone) {
    // Armazena as coordenadas do boss no momento da criação
    boss_x = boss.x;
    boss_y = boss.y;
} else {
    // Define valores padrão caso nenhum boss seja encontrado
    boss_x = -1;
    boss_y = -1;
}

//localiza o soldado mais proximo
soldado = instance_nearest(x, y, oSoldado);

// Verifica se o boss existe
if (soldado != noone) {
    // Armazena as coordenadas do boss no momento da criação
    soldado_x = soldado.x;
    soldado_y = soldado.y;
} else {
    // Define valores padrão caso nenhum boss seja encontrado
    soldado_x = -1;
    soldado_ys = -1;
}

