// Verifica se o diálogo ainda está ativo
if (!finished) {
    // Texto atual visível
    var visible_text = string_copy(dialog_lines[current_line], 1, floor(char_index));

    // Ajusta a largura e altura da caixa de diálogo dinamicamente
    dialog_box_width = max(200, string_width(visible_text) + 20);  // Largura mínima de 200
    dialog_box_height = max(100, string_height(visible_text) + 20); // Altura mínima de 100

    // Coordenadas para a posição da caixa de diálogo
    var box_x = 50;
    var box_y = room_height - dialog_box_height - 20;

    // Desenhar a caixa de diálogo
    draw_set_color(c_black);
    draw_rectangle(box_x, box_y, box_x + dialog_box_width, box_y + dialog_box_height, false);
    draw_set_color(c_white);

    // Desenhar o texto
    draw_text(box_x + 10, box_y + 10, visible_text);
}
