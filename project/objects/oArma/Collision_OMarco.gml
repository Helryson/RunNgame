// Se o player colidir com a arma, é para coletar
global.arma_player_atual = arma_atual

// Adiciona as balas
global.num_balas_player = global.originais[13] // O indice 13 é o responsável pelo default

// Cria uma instancia e depois destroi a colidida
instance_create_layer(x, y, "Main_Layer", oArma)

instance_destroy()