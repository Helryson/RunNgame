
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


global.armas = [pistola, ak47] // Array com as armas que existem no jogo
global.invencibilidade_player = false //Se o player é invencivel
global.tempo_invencibilidade_player = 1000

// Pegar os valores no arquivo de configurações (para manter os valores)
var lines = [];

// Open the file in read mode
var file = file_text_open_read("player_settings.txt");

if (file != -1) {  // Checa se o arquivo abriu com sucesso
    var line_index = 0;

    // Anda sobre o arquivo
    while (!file_text_eof(file)) {
        lines[line_index] = file_text_readln(file);
		show_debug_message(string(lines[line_index]))
        line_index++;
    }

    // Close the file
    file_text_close(file);
} else {
    show_message("Erro ao abrir o arquivo");
}

global.valores = lines // Valores do array de line para salvar depois
global.vida_player = real(lines[0])
global.hsp_player = real(lines[1])
global.vsp_player = real(lines[2])
global.grv_player = real(lines[3])
global.walkspd_player = real(lines[4])
global.pulo = false // Define se o player ta no evento de pulo

//global.shot_timer = 0

// Inicializa global.armas com arrays internos: {arma, tempo}
 // Array contendo cada velocidade de tiro respectivamente
//global.tempo_tiro_arma_player = []



// 'lines' array now contains each line from the file

// Armas do player
global.arma_player_atual = global.armas[real(lines[6])]

//pistola if lines[4] == "pistola" else ak47 if lines[4] == "ak47" else semtextura
global.tempo_arma_player_atual = real(lines[7])
global.ultima_bala = real(lines[8])
//global.arma_player_indx = 0

// Sobre atirar
global.velocidade_tiro = real(lines[9])
global.velcoidade_tiro_o = real(lines[10])
global.ultima_bala = real(lines[11])

// Gravidade
global.gravidade = real(lines[12])
global.num_balas_player = real(lines[13])

