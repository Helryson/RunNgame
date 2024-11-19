/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
speed = 7
direction = 0; // Inicializa a direção
id_plataforma = 0 // O id da possivel plataforma que o objeto ta tocando
id_pedra = 0 // o id da possivel pedra que o objeto colidir

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
