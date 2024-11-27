/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Set the drawing color and font
draw_set_color(c_white);
draw_set_font(-1); // Default font

// Get X and Y positions (modify as needed)
var posX = string(x); // Replace mouse_x with camera_x if using a camera
var posY = string(y); // Replace mouse_y with camera_y if using a camera

// Draw the X and Y coordinates
draw_text(10, 10, "X: " + posX + "  Y: " + posY);

