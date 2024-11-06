// Para não ser os mesmos numeros aleatórios a cada abertura
randomize()

// Calcular tamnanho da tela

fatorW = 2
fatorH = 2

w = room_width / fatorW
h = room_height / fatorH

// Redimensionar
window_set_size(w, h)


// Define a variável global para as variáveis do player
// para não resetar caso mude de sala

global.vida_player = 6
global.hsp_player = 0
global.vsp_player = 0
global.grv_player = 0.75
global.walkspd_player = 4
//global.shot_timer = 0

// Inicializa global.armas com arrays internos: {arma, tempo}
global.armas = [
    [ak47, 0.2],    // [arma, tempo]
    [pistola, 0.4]
];
 // Array contendo cada velocidade de tiro respectivamente
global.tempo_tiro_arma_player = []

// Armas do player

global.arma_player_atual = pistola
global.tempo_arma_player_atual = noone
global.arma_player_indx = 0

// Sobre atirar
global.velocidade_tiro = 0
global.velcoidade_tiro_o = 80
global.ultima_bala = 0

// Gravidade
global.gravidade = 17





