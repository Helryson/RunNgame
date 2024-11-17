// Voltar para o y inicial
if (y > y_inicial){
	// Diminuir o y gradativamente até chegar em y_inicial
	y -= global.gravidade
}

if (y < y_inicial){
	y += global.gravidade
}

// Chances de aparecer outro objeto de arma
var spawn_arma = irandom_range(1, 100000)

if spawn_arma <= chances{
	var valor_x = irandom_range(0, room_width)
	instance_create_layer(valor_x, 0, "Main_Layer", oArma)
}
