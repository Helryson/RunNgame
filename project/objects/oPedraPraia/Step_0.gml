var colisoes = [OMarco, oSoldado, oBala, oBalaInimigo, oArma, oBoss]
var colisoes_destrutivas = [oBala, oBalaInimigo]

for (var c=0; c<array_length(colisoes); c+=1){
	var objeto = colisoes[c]
	if instance_number(objeto) >= 1{
		var player_proximo = instance_nearest(x, y, objeto)

		var distanciaX = x - player_proximo.x
		var distanciaY = y - player_proximo.y

		// Modulo das distancias
		var modulo_dx = distanciaX
		var modulo_dy = distanciaY

		if modulo_dx < 0{
			modulo_dx *= -1
		}

		if modulo_dy < 0{
			modulo_dy *= -1
		}

		// Verificar se o player está proximo o suficiente em x e y para a logica se aplicar
		if (modulo_dx <= distancia_afetarX and modulo_dy <= distancia_afetarY){
			if not array_contains(colisoes_destrutivas, objeto){
				// Aplicar a logica
				var pixels_ate_bordaX = sprite_width / 2
				var pixels_ate_bordaY = sprite_height / 2	
	
	
				// Para casos que a distancia for neegativa
				if distanciaX > 0 and modulo_dx <= pedra_distanciax_origem{
					player_proximo.x -= 6
				}
	
				//show_debug_message(string(distanciaX)+", "+string(pedra_distanciax_origem))
				// a distancia é positiva
				if distanciaX < 0 and modulo_dx <= pedra_distanciax_origem{
					player_proximo.x += 6
				}
			}else{
				instance_destroy(objeto)
			}
		}
	}
}