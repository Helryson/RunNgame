// Avançar caracteres do texto atual
if (!finished) {
    char_index += text_speed;  // Adiciona caracteres gradualmente

    // Quando o texto completo é exibido
    if (char_index >= string_length(dialog_lines[current_line])) {
        char_index = string_length(dialog_lines[current_line]); // Garante o limite
    }

    // Avançar para o próximo texto com clique do botão esquerdo
    if (mouse_check_button_pressed(mb_left)) {
        if (char_index == string_length(dialog_lines[current_line])) {
			if (current_line >= array_length(dialog_lines)) { // Verifica se a current line da ultima iteração é a ultima, se for, destroy o chat
                finished = true;  // Marca o fim do diálogo
                instance_destroy(); // Remove o objeto (opcional)
            }
            // Avança para a próxima linha
            current_line += 1;
            char_index = 0;

           
        }
    }
}

