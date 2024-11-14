//var teleporte_numX =  irandom_range(x-30, x+30) //Quantas unidades a caixa de armas vai reaparecer
//var teleporte_numY =  y

// Se o player colidir com a arma, é para coletar
global.arma_player_atual = arma_atual

// Adiciona as balas
global.num_balas_player = global.originais[13] // O indice 13 é o responsável pelo default


//// Cria uma instancia e depois destroi a colidida
//instance_create_layer(teleporte_numX, teleporte_numY, "Main_Layer", oArma)

instance_destroy()