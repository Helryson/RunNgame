//Windows options

if instance_number(oTextBox) <= 0{
	global.is_dialog_active = false
}

// Deletar a tela de carregamento se tiver alguma
if instance_number(oCarregamento) >= 1{
	var carregamento = instance_nearest(x, y, oCarregamento)
	instance_destroy(carregamento)
}

//show_debug_message("("+string(x)+", "+string(y)+")")

// Para facilitar o debug de mecanicas! Tirar quando finalizado
if keyboard_check_pressed(ord("K")){
	global.dano_armas = [1000000000, 1000000000, [1000000000, 1000000000, 1000000000], 1000000000]
	global.hp_tempo = 0
	global.tempo_recover = 0
	global.vida_player = 600
}


if not global.player_danificado{ // Só recupera dano se o player não estiver danificado
	// Recuperar hp
	hp_tempo -= 1

	if hp_tempo <= 0{
		global.vida_player += 1
		hp_tempo = global.hp_tempo
	}
}else{
	hp_recover -= 1
	if hp_recover <= 0{ // se o tempo de recover de hp tiver zerado...
		global.player_danificado = false
		hp_recover = global.tempo_recover
	}
}
// Se a vida for maior que 100

if global.vida_player > global.originais[0]{
	global.vida_player = global.originais[0]
}

// O máximo que o player pode chegar
var max_y = y_inicial



//if y < y_inicial{
//	// SE o y for menor que o y inicial, pulando
//	global.pulo = true
//}else{
//	global.pulo = false
//}


// Atualiza o tempo do tiro
//global.shot_timer -= 0.1; // Diminui o timer a cada passo

if place_meeting(x+global.hsp_player, y, oArma){
	while(!place_meeting(x+sign(global.hsp_player), y, oArma)){
		x = x + sign(global.hsp_player)
	}
	global.hsp_player = 0
}

//if place_meeting(x+global.hsp_player, y, oPlataforma){
//	while(!place_meeting(x+sign(global.hsp_player), y, oPlataforma)){
//		x = x + sign(global.hsp_player)
//	}
//	global.hsp_player = -7
//}
//x = x +  global.hsp_player

//if place_meeting(x, y+global.hsp_player, oPlataforma){
//	while(!place_meeting(x, y+sign(global.hsp_player), oPlataforma)){
//		y = y + sign(global.hsp_player)
//	}
//	global.vsp_player = -7
//}

// y = y +  global.hsp_player


//Calculate Movement
if !global.is_dialog_active{
	
	if global.key_left and global.player_andar{
	    x-= 3
		image_xscale = -1
		direction = 180
	}

	if global.key_right and global.player_andar {
		x += 3
		image_xscale = 1
		direction = 0
	}
	
	var move = global.key_right - global.key_left;

	global.hsp_player = move * (global.walkspd_player - 2)
	global.vsp_player = global.vsp_player + global.grv_player;

	if(global.key_jump and global.ativar_tecla_pulo and not global.pulo) {
	    global.pulo = true;
	    global.tecla_pressionada = true;
    
	    // Troca o sprite para o de pulo
		if sprite_index != sMarcoDano{
			var pulando_sprites = [sMarcoShotgunPuando, sMarcoPistolaPuando, sMarcoAk47Puando]
			
			// Para evitar sprite congelando
			if not array_contains(pulando_sprites, sprite_index){
			    if global.arma_player_atual == pistola {
			        sprite_index = sMarcoPistolaPuando;
			    }else if global.arma_player_atual == shotgun{
					sprite_index = sMarcoShotgunPuando
				}else if global.arma_player_atual == ak47{
					sprite_index = sMarcoAk47Puando
				}
			}
		}
	} else {
	    global.tecla_pressionada = false;
	}
	
	// Cria instância de bala na camada instances_1 quando clica com botão esquerdo
	if (global.left_mouse) {
		switch(global.arma_player_atual){
			case ak47: 
				global.tempo_arma_player_atual = 0.2
				break
			case pistola: 
				global.tempo_arma_player_atual = 0.4
				break
			case shotgun: 
				global.tempo_arma_player_atual = 0.7
				break
		}
		show_debug_message(string(global.tempo_jogo)+" - "+string(global.ultima_bala)+" >= "+string(global.tempo_arma_player_atual *  1000) + " && "+string(global.num_balas_player)+" >=1")
		// Sistema de tiro refeito
		if global.tempo_jogo - global.ultima_bala >= global.tempo_arma_player_atual * 1000 && global.num_balas_player >= 1{
			show_debug_message("Hey!")
		
			var bala
			global.num_balas_player -= 1
			bala = instance_create_layer(x, y-(sprite_height/2.5), "Instances", oBala)
			global.num_balas_player -= 1
			if global.num_balas_player == 0{
				global.arma_player_atual = global.armas[0]
				global.num_balas_player = 10000000000000000
			}
			global.ultima_bala = global.tempo_jogo
			show_debug_message("Atirando!")
		
			if !global.key_up and !global.key_down{
				if image_xscale < 0 {
					bala.direction = 180
				}
				else {	
					bala.direction = 0
				}
			}
			else if global.key_up and global.key_left{
				bala.direction = 155
				bala.image_angle = 155
			}
			else if global.key_up and global.key_right{
				bala.direction = 25
				bala.image_angle = 25
			}
			else{
				if global.key_up{
					bala.direction = 90
					bala.image_angle = 90
				}
			
				else if global.key_down and global.pulo{
					bala.direction = -90
					bala.image_angle = -90
				}
				else if global.key_down{
					if image_xscale < 0{
						bala.direction = 180 
					}
					else{
						bala.direction = 0 
					}
				}
			}
		}
		
	}
	
	if sprite_index != sMarcoDano{
			
		switch (global.arma_player_atual){
			case pistola:
				sprite_index = sMarcoPistola
				break
			case ak47:
				sprite_index = sMarcoAK47
				break
			case shotgun:
				sprite_index = sMarcoShotgun
				break
		}
		
		// Lista de sprites de caminhada
	    var andando_sprites = [sMarcoPistolaAndando, sMarcoShotgunAndando, sMarcoAk47Andando]

	    // Só troca o sprite se não estiver em uma animação de caminhada já existente
	    if not array_contains(andando_sprites, sprite_index){
	        if global.key_left or global.key_right{
	            global.tecla_pressionada = true
	            switch global.arma_player_atual{
	                case pistola:
	                    // Verifica se o sprite já está em animação para pistola
	                    if (sprite_index != sMarcoPistolaAndando) {
	                        sprite_index = sMarcoPistolaAndando
	                        image_index = 0  // Começar a animação do primeiro frame
							image_speed = 0.2  // Definir a velocidade da animação (ajuste conforme necessário)
	                    }
	                    break

	                case ak47:
	                    // Verifica se o sprite já está em animação para ak47
	                    if (sprite_index != sMarcoAk47Andando) {
	                        sprite_index = sMarcoAk47Andando
	                        image_index = 0  // Começar a animação do primeiro frame
							image_speed = 0.2  // Definir a velocidade da animação (ajuste conforme necessário)
	                    }
	                    break

	                case shotgun:
	                    // Verifica se o sprite já está em animação para shotgun
	                    if (sprite_index != sMarcoShotgunAndando) {
	                        sprite_index = sMarcoShotgunAndando
	                        image_index = 0  // Começar a animação do primeiro frame
							image_speed = 0.2  // Definir a velocidade da animação (ajuste conforme necessário)
	                    }
	                    break
	            }
	        }else{
	            global.tecla_pressionada = false
	        }
	    }
	}	
}else{
	global.hsp_player = 0
}


// Aumenta o y até chegar no final do pulo
var diferenca_altura = y - (y_inicial - global.altura_pulo);
var diferenca_y_inicial = y - y_inicial;

if diferenca_altura > 0 and global.pulo {
	 
    y -= global.velocidade_pulo;
    global.ativar_tecla_pulo = false; // Desativa a tecla de pulo enquanto estiver no ar
} else if global.pulo {
    // Finaliza o pulo no ponto mais alto
    global.pulo = false;
}

// Descendo até chegar no y original
if diferenca_y_inicial < 0 and not global.pulo {
    y += global.velocidade_pulo;
    if y >= y_inicial {
        // Só permite pular novamente quando voltar ao chão
        y = y_inicial;
        global.ativar_tecla_pulo = true;
    }
}


if sprite_index != sMarcoDano{
	// Se nenhuma tecla que troca sprite tiver pressionada
	if not global.tecla_pressionada{
		if global.arma_player_atual == pistola{
			sprite_index = sMarcoPistola
		}
	}
}

//Horizontal Collision
/* if (place_meeting(x+hsp, y, Object3)){
	while(!place_meeting(x+sign(hsp), y, Object3)){
		x = x + sign(hsp);
	}
	
	hsp = 0;
}*/
x = x + global.hsp_player;

// Define o meio do sprite para verificar os limites
var half_width = sprite_width / 2;
var half_height = sprite_height / 2;

// Limite Horizontal - Impede ultrapassar as bordas esquerda e direita
/* Horizontal Limit - Prevents crossing left and right edges
if (x - half_width < 0) {
    x = half_width; // Left edge limit
} 
else if (x + half_width > room_width) {
    x = room_width - half_width; // Right edge limit
}

*/

var salvar = false // Salvar as alteraçoes
var anterior_ou_prox = "" // "anterior" vai para a sala anterior, "prox" para a proxima


// Se o x for >= que room_width, ir pra proxima "sala"
if x >= room_width{
	if room != room_last and room != gameover{
		salvar = true
		anterior_ou_prox = "prox"
	}else{
		x = room_width
	}
}

// Se o x <= 0, sala anterior
if x <= 0{
	if room != room_first{
		
		salvar = true
		anterior_ou_prox = "anterior"
	}else{
		x = 0
	}
}

// Se salvar for true, vai salvar tudo no arquivo
if salvar{
	// Parar a musica de fundo para não duplicar
	audio_stop_sound(fundo)
	var valores_2 = [global.vida_player,
						global.hsp_player,
						global.vsp_player,
						global.grv_player,
						global.walkspd_player,
						global.velocidade_pulo,
						global.arma_player_atual,
						global.tempo_arma_player_atual,
						global.ultima_bala,
						global.velocidade_tiro,
						global.velcoidade_tiro_o,
						global.ultima_bala,
						global.gravidade,
						global.num_balas_player]
	
	var novos_valores = []
	for (var i=0; i<array_length(global.valores); i+=1){
		var valor_string = string(valores_2[i])
		var valor_normal = valores_2[i]
		
		// Converter sprite para o indice do sprite
		for (var arma=0; arma < array_length(global.armas); arma+=1){
			if global.armas[arma] == valor_normal{
				valor_string = string(arma)
				break
			}
		}
		
		array_insert(novos_valores, array_length(novos_valores), valor_string)
	}
	global.valores = novos_valores
	
	
	// Abrindo/criando o arquivo para escrita
	var file = file_text_open_write("player_settings.txt");

	// Iterando pelo array e escrevendo cada item em uma linha do arquivo
	for (var i = 0; i < array_length(global.valores); i++) {
		//show_debug_message(global.valores[i])
	    file_text_write_string(file, string(global.valores[i])); // Escreve o item do array
	    file_text_writeln(file); // Adiciona uma nova linha
	}

	// Fechando o arquivo
	file_text_close(file);
}

// Para proxima ou para a sala anterior
if anterior_ou_prox == "anterior"{
	instance_create_layer(0, 0, "Instances", oCarregamento)
	room_goto_previous()
}else if anterior_ou_prox == "prox"{
	if room_next(room) != gameover{
		instance_create_layer(0, 0, "Instances", oCarregamento)
		room_goto_next()
	}
}else{
	// Redundancia para evitar problemas
	salvar = false
}


// Voltar para o y inicial
if (y > y_inicial){
	// Diminuir o y gradativamente até chegar em y_inicial
	y -= global.velocidade_pulo
	//global.pulo = false // Significa que o player chegou no chão
}

// Vertical Limit - Prevents crossing top and bottom edges
//if (y - half_height < 0) {
//    y = half_height; // Top edge limit
//} 
//else if (y + half_height > room_height) {
//    y = room_height - half_height; // Bottom edge limit
//}


//Vertical Collision
/*
if (place_meeting(x, y+global.vsp_player, oCenario)){
	while(!place_meeting(x, y+sign(global.vsp_player), oCenario)){
		y = y + sign(global.vsp_player);
	}
	
	global.vsp_player = 0;
}
*/

// Colisão com a bala
/*if (place_meeting(x, y, oBalaInimigo)) {
    var bala = instance_place(x, y, oBalaInimigo); // Encontra a bala em colisão
    if (bala != noone) {
        vida -= 1; // Reduz a saúde do inimigo
        
        // Altera o sprite baseado na vida restante
*/        


// Se o player morrer, acabou
if global.vida_player <= 0{
	// Reseta o arquivo de configurações do player na morte
	
	var file = file_text_open_read("global_default.txt");
	var lines = global.originais
	
	// Salvar as linhas do arquivo original
	var file_player = file_text_open_write("player_settings.txt");
	for (var i = 0; i < array_length(lines); i++) {
	    file_text_write_string(file_player, lines[i]); // Escreve o item do array
	}

	file_text_writeln(file_player); // Adiciona uma nova linha	
	file_text_close(file_player)
	//audio_stop_sound(audio)
	room_goto(gameover)
}

if sprite_index != sMarcoDano{
	sprite_atual = sprite_index
} // Para ficar mais facil de resetar o sprite
