/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Anda o x
if x <= x_minimo{
	x += velocidade_voo_x
	direcao_x = 1
}else if x >= x_maximo{
	x -= velocidade_voo_x
	direcao_x = -1
}else{
	x += velocidade_voo_x * direcao_x
}

// Anda o y
if y >= y_minimo{
	y -= velocidade_voo_y
	direcao_y = 1
}else if y <= y_maximo{
	y += velocidade_voo_y
	direcao_y = -1
}else{
	y += velocidade_voo_x * direcao_y
}

