/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Anda o x
if x <= x_minimo{
	x += velocidade_voo_x
	direcao_x = 1
}else if x >= x_maximo{
	x -= velocidade_voo_x
	direcao_x = -1
}

// Anda o y
if y >= y_minimo{
	y -= velocidade_voo_y
	direcao_y = -1
}

if y <= y_maximo{
	y += velocidade_voo_y
	direcao_y = 1
}

x += velocidade_voo_x * direcao_x
y += velocidade_voo_y * direcao_y

//show_debug_message(string(x)+", "+string(y)+" - "+string(x_minimo)+", "+string(y_minimo)+" - "+string(x_maximo)+", "+string(y_maximo))

frames_tiro_var -= 1

if frames_tiro_var == 0{
	var bala = instance_create_layer(x, y, "Instances", oMissel)
	frames_tiro_var = frames_tiro 
}

