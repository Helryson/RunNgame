//Windows options

if not global.player_danificado{ // Só recupera dano se o player não estiver danificado
	// Recuperar hp
	hp_tempo -= 1

	if hp_tempo <= 0{
		global.vida_player += 5
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

// Trocar o sprite dependendo da arma
switch (global.arma_player_atual){
	case pistola:
		sprite_index = sMarcoPistola
		break
	case ak47:
		sprite_index = sMarcoAK47
		break
}


// O máximo que o player pode chegar
var max_y = y_inicial



if y < y_inicial{
	// SE o y for menor que o y inicial, pulando
	global.pulo = true
}else{
	global.pulo = false
}

if keyboard_check_pressed(vk_f11){
window_set_fullscreen(!window_get_fullscreen());
};


// Atualiza o tempo do tiro
//global.shot_timer -= 0.1; // Diminui o timer a cada passo

if place_meeting(x+global.hsp_player, y, oArma){
	while(!place_meeting(x+sign(global.hsp_player), y, oArma)){
		x = x + sign(global.hsp_player)
	}
	global.hsp_player = 0
}

if place_meeting(x+global.hsp_player, y, oPlataforma){
	while(!place_meeting(x+sign(global.hsp_player), y, oPlataforma)){
		x = x + sign(global.hsp_player)
	}
	global.hsp_player = -7
}
x = x +  global.hsp_player

//if place_meeting(x, y+global.hsp_player, oPlataforma){
//	while(!place_meeting(x, y+sign(global.hsp_player), oPlataforma)){
//		y = y + sign(global.hsp_player)
//	}
//	global.vsp_player = -7
//}

// y = y +  global.hsp_player


//// Troca de arma
//if (global.middle_mouse){ 
//		// Se o indice for menor que o numero total de armas... adicionar mais um no index
//		if global.arma_player_indx < armas_tamanho{
//			global.arma_player_indx += 1
//		}else{
//			global.arma_player_indx = 0	
//		}
//}

//Calculate Movement
var move = global.key_right - global.key_left;

global.hsp_player = move * (global.walkspd_player - 2)
global.vsp_player = global.vsp_player + global.grv_player;

if(global.key_jump and y >= max_y) {
	global.vsp_player = global.velocidade_pulo
	global.tecla_pressionada = true
	
	// Troca o sprite para o de pulo
	if global.arma_player_atual == pistola{
		sprite_index = sMarcoPistolaPuando
	}
	
}else{
	global.tecla_pressionada = false
}

if global.key_left
{
    x-=1
	image_xscale = -0.6235294
	direction = 180
}

if global.key_right{
	x+=1 
	image_xscale = 0.6235294
	direction = 0
}


// Trocar sprite caso esteja andando
if global.key_left or global.key_right{
	global.tecla_pressionada = true
	if global.arma_player_atual == pistola{
		sprite_index = sMarcoPistolaAndando
	}
}else{
	global.tecla_pressionada = false
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
	}
	
	
	// Sistema de tiro refeito
	if global.tempo_jogo - global.ultima_bala >= global.tempo_arma_player_atual * 1000 && global.num_balas_player >= 1{
		//show_debug_message(string(global.ultima_bala), string(global.tempo_arma_player_atual))
		var bala
		global.num_balas_player -= 1
		bala = instance_create_layer(x, y-(sprite_height/2.5), "Instances", oBala)
		global.ultima_bala = global.tempo_jogo
		
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

// Se nenhuma tecla que troca sprite tiver pressionada
if not global.tecla_pressionada{
	if global.arma_player_atual == pistola{
		sprite_index = sMarcoPistola
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
		show_debug_message(global.valores[i])
	    file_text_write_string(file, string(global.valores[i])); // Escreve o item do array
	    file_text_writeln(file); // Adiciona uma nova linha
	}

	// Fechando o arquivo
	file_text_close(file);
}

// Para proxima ou para a sala anterior
if anterior_ou_prox == "anterior"{
	room_goto_previous()
}else if anterior_ou_prox == "prox"{
	if room_next(room) != gameover{
		room_goto_next()
	}
}else{
	// Redundancia para evitar problemas
	salvar = false
}


y = y + global.vsp_player;


// Voltar para o y inicial
if (y > y_inicial){
	// Diminuir o y gradativamente até chegar em y_inicial
	//y -= global.vsp_player
	global.vsp_player = 17
	
	y = y_inicial
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


