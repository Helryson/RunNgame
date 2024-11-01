// Para não ser os mesmos numeros aleatórios a cada abertura
randomize()

// Define o maximo de Y (em quantidade de vezes) para evitar o glitch do player voador
global.max_playerY = 1.25

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
global.shot_timer = 0

// Gravidade
global.gravidade = 17

// Armas do player

global.armas_player = []
global.arma_player_indx = 0



