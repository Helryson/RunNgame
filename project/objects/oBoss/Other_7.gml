if sprite_index == sMechaDano{
	switch (arma_atual){
		case sBalaInimigo:
			sprite_index = sMecha
			break
		case sFogo:
			sprite_index = sMechaFlameTrower
	}
}

if sprite_index == sMechaMorte{
	// Troca o sprite por sem textura quando
	// a animação de morte acabar, assim espera
	// alguns segundos antes de encerrar o jogo
	sprite_index = semtextura

}