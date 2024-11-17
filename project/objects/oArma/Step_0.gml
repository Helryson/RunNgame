// Voltar para o y inicial
show_debug_message(string(y))

if (y > y_inicial){
	// Diminuir o y gradativamente até chegar em y_inicial
	y -= global.gravidade
}

if (y < y_inicial){
	y += global.gravidade
}


