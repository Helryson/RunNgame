// As armas do jogo 
global.armas = [ak47, pistola]
global.armas_tempo_player = [] // Array contendo cada velocidade de tiro respectivamente
numero_armas = array_length(global.armas)
arma = irandom_range(0, numero_armas-1)

// Pega uma arma aleatoria para por no sprite
sprite_index = global.armas[arma]
