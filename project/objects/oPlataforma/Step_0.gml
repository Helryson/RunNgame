var colisoes = [OMarco, oSoldado, oBala, oBalaInimigo, oArma, oBoss, oArma]
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
			objeto.id_plataforma = id
			if not array_contains(colisoes_destrutivas, objeto){
				// Aplicar a logica
				var pixels_ate_bordaX = sprite_width / 2
				var pixels_ate_bordaY = sprite_height / 2	
	
				// X
				// Para casos que a distancia for neegatwva
				if distanciaX > 0 and modulo_dx <= pedra_distanciax_origem{
					player_proximo.y_inicial = y
				}
	
				//show_debug_message(string(distanciaX)+", "+string(pedra_distanciax_origem))
				// a distancia é positiva
				if distanciaX < 0 and modulo_dx <= pedra_distanciax_origem{
					player_proximo.y_inicial = y
				}
				
				//Y
				
				//show_debug_message(string(distanciaY)+", "+string(pedra_distanciay_origem))
				if distanciaY >= 0 and modulo_dy <= pedra_distanciay_origem{
					player_proximo.y_inicial = y
				}
	
				//show_debug_message(string(distanciaX)+", "+string(pedra_distanciax_origem))
				// a distancia é positiva
				if distanciaY < 0 and modulo_dy <= pedra_distanciay_origem{
					player_proximo.y_inicial = y
				}
				

				
			}else{
				// Ignorando a colisão com coisas que deveriam destruir por
				// estar bugado.
				//show_debug_message(string(modulo_dy)+", "+string(distancia_afetarY))
				//instance_destroy(objeto)
			}
		}else{
			// Só roda se o ID for o mesmo! Se não, nem tenta
			if objeto.id_plataforma == id{
				if not array_contains(colisoes_destrutivas, objeto){
					// Só reseta o y inicial se o player não tiver no mesmo x que abrange o objto
					if modulo_dx > sprite_height/2{
						player_proximo.y_inicial = player_proximo.y_inicial_o
					}
			}
			}
		}
	}
}