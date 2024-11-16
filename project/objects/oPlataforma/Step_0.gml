var colisoes = [OMarco, oSoldado, oBala, oBalaInimigo, oArma, oBoss]
var colisoes_destrutivas = [oBala, oBalaInimigo]
var players = [OMarco]

for (var c=0; c<array_length(colisoes); c+=1){
	var objeto = colisoes[c]
	if instance_number(objeto) >= 1{
		var player_proximo = instance_nearest(x, y, objeto)

		var distanciaX = player_proximo.x - x
		var distanciaY = player_proximo.y - y

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
		if (modulo_dx <= distancia_afetarX and (modulo_dy <= distancia_afetarY)){
			if not array_contains(colisoes_destrutivas, objeto){
				show_debug_message(string("OK"))
				// Aplicar a logica
				var pixels_ate_bordaX = sprite_width / 2
				var pixels_ate_bordaY = sprite_height / 2	
	
				// X
				// Para casos que a distancia for neegativa
				if distanciaX > 0 and modulo_dx <= pedra_distanciax_origem{
					if array_contains(players, objeto){
						player_proximo.y_inicial = y
					}else{
						player_proximo.y = y
					}
				}
	
				//show_debug_message(string(distanciaX)+", "+string(pedra_distanciax_origem))
				// a distancia é positiva
				if distanciaX < 0 and modulo_dx <= pedra_distanciax_origem{
					if array_contains(players, objeto){
						player_proximo.y_inicial = y
					}else{
						player_proximo.y = y
					}
				}
				
				//Y
				
				//show_debug_message(string(distanciaY)+", "+string(pedra_distanciay_origem))
				if distanciaY >= 0 and modulo_dy <= pedra_distanciay_origem{
					if array_contains(players, objeto){
						player_proximo.y_inicial = y
					}else{
						player_proximo.y = y
					}
				}
	
				//show_debug_message(string(distanciaX)+", "+string(pedra_distanciax_origem))
				// a distancia é positiva
				if distanciaY < 0 and modulo_dy <= pedra_distanciay_origem{
					if array_contains(players, objeto){
						player_proximo.y_inicial -= 1
					}else{
						player_proximo.y -= 1
					}
				}
				

				
			}else{
				// Ignorando a colisão com coisas que deveriam destruir por
				// estar bugado.
				//show_debug_message(string(modulo_dy)+", "+string(distancia_afetarY))
				//instance_destroy(objeto)
			}
		}else{
			if objeto == OMarco{
				player_proximo.y_inicial = player_proximo.y_inicial_o
			}
		}
	}
}