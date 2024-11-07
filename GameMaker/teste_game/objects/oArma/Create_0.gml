numero_armas = [ak47, pistola]
// Escolhe uma arma aleatória com base no tamanho do array
arma_indice = irandom(array_length(numero_armas) - 1);

// Atribui a arma escolhida ao jogador
arma_atual = numero_armas[arma_indice];
oArma.sprite_index = arma_atual

