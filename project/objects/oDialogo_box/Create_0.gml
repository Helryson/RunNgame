// Inicializa as variáveis do diálogo
lines = [];
dialog_lines = lines;      // Usa as falas carregadas do arquivo
current_line = 0;          // Começa na primeira linha
text_speed = 2;            // Velocidade do texto (caractere por caractere)
char_index = 0;            // Quantidade de caracteres já exibidos
finished = false;          // Controle do estado do diálogo
dialog_box_width = 200;    // Largura inicial da caixa de diálogo
dialog_box_height = 100;   // Altura inicial da caixa de diálogo



file = file_text_open_read("datafiles/dialog_room1.txt");

if (file != -1) {
    var line_index = 0;

    // Anda sobre o arquivo
    while (!file_text_eof(file)) {
        array_insert(lines, array_length(lines), file_text_readln(file));
        line_index += 1;
    }

    // Fecha o arquivo
    file_text_close(file);
} else {
    //show_message("Erro ao abrir o arquivo do player");
}
