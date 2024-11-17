
// Escolhe uma arma aleatória com base no tamanho do dd6array
arma_indice = irandom(array_length(global.armas) - 1);
id_plataforma = 0 // O id da possivel plataforma que o objeto ta tocando

// Atribui a arma escolhida ao jogador
arma_atual = global.armas[arma_indice];

centro_gravitacional = instance_nearest(x, y, oCentroGravitacional)
y_inicial = centro_gravitacional.y
y_inicial_o = centro_gravitacional.y
chances = 1 // Quantas vezes a cada chances numeros aleatorios para spawnar