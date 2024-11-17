var colisoes = [OMarco, oSoldado, oBoss, oArma]

for (var objindx=0; objindx<array_length(colisoes); objindx+=1){
	var objeto = colisoes[objindx]
	if instance_number(objeto) >= 1{
		var limite_proximo = instance_nearest(x, y, objeto) // O objeto de limite mais proximo
		var distancia_limiteX = objeto.x - x // A distancia do x do player do x do objeto de limite
		var distancia_borda_limiteX = 0 // A distancia da borda do limite
	
		if distancia_limiteX < 0{
			// Calculo da distancia da borda do limite mais proximo caso a distancia do ponto origem do limite for menor que zero
			distancia_borda_limiteX = distancia_limiteX + sprite_width/2
		}else if distancia_limiteX > 0{
			// Caso for maior que zero
			distancia_borda_limiteX = distancia_limiteX - sprite_width/2
		}	
		if distancia_borda_limiteX < 10 and distancia_borda_limiteX >= 0{
			objeto.x += 3
		}else if distancia_borda_limiteX > -10 and distancia_borda_limiteX <= 0{
			objeto.x -= 3
		}
	}
}