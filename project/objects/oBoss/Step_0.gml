// Instancia do player mais próxima

// Voltar para o y inicial
if (y > y_inicial){
	// Diminuir o y gradativamente até chegar em y_inicial
	y -= global.gravidade
}

if (y < y_inicial){
	y += global.gravidade
}


// Distância do player e o soldado
var distancia = x - player_perto.x;
var bala_y = y-(sprite_height*0.3)


var bala_direcao = radtodeg(arctan2((bala_y-player_perto.y), (player_perto.x-x)))
// Formula utilizada:
// atan2(y,x)

// Verifica mudança de direção

if distancia <= 0{
	image_xscale = -1
	direction = 0
}else{
	image_xscale = 1
	direction = 180
}


// Se o temporizador de espera estiver ativo, decrementa e pausa o movimento
if (espera > 0) {
    espera -= 1; // Decrementa o temporizador
   // hsp = 0; // Interrompe o movimento horizontal durante a pausa
} else {
	// O movimento do boss vai ser de manter distancia
	var distanciaX = player_perto.x - x
	
	// checar no minimo
	if distanciaX > min_x * -1 and distanciaX < 0{
		x += 3
	}else if distanciaX < min_x and distanciaX > 0{
		x -= 3
	}
	
	// checar no maximo
	
	if distanciaX < max_x*-1{
		x -= 3
	}else if distanciaX > max_x{
		x += 3
	}
	
	
    //// Controle de movimento e pausa
    //if (move_timer > 0) {
    //    // Se o jogador estiver perto, mover o soldado para ele
    //    if (distancia < 200 && distancia > 10) {
    //        hsp = -walkspd; // Move para a esquerda
	//		// sprite_index = sSoldado_andando
    //    }
    //    else if (distancia > -200 && distancia < -10) {
    //        hsp = walkspd; // Move para a direita
	//		//sprite_index = sSoldado_andando
    //    }
    //    move_timer -= 1; // Decrementa o temporizador de movimento
    //} 

    //// Se o temporizador de pausa estiver ativo, decrementa
    //if (pause_timer > 0) {
    //    pause_timer -= 1; // Decrementa o temporizador de pausa
    //} else {
    //    // Ativar pausa
    //    hsp = 0; // Interrompe o movimento
    //    pause_timer = room_speed * 2; // Reinicia o temporizador de pausa (2 segundos)
    //    move_timer = room_speed * 2; // Reinicia o temporizador de movimento (2 segundos)
    //}

    //// Se o tempo de espera para disparo estiver ativo, decrementa
    //if (shoot_wait_time > 0) {
    //    shoot_wait_time -= 1; // Decrementa o tempo de espera para disparo
    //} else {
    //    can_shoot = true; // Permite o disparo após a espera
    //}
}

// Horizontal Collision
x += hsp;

/* Vertical Collision
vsp += grv;

if (place_meeting(x, y + vsp, oCenario)) {
    while (!place_meeting(x, y + sign(vsp), oCenario)) {
        y += sign(vsp);
    }
    vsp = 0;
}
y += ;*/

// Vendo se o x passou do limite
// Verificação da distancia do player do objeto que define o limite

if (can_shoot) {
    if (shot_timer > 0) {
        shot_timer -= 1; // Decrementa o timer
    }

    if (shot_timer <= 0) {
        if (wait_time > 0) {
            wait_time -= 1; // Decrementa o tempo de espera
        } else {
            var proj = instance_create_layer(x, bala_y, "Instances", oBalaInimigo);
            proj.direction = bala_direcao; // Define a direção do projétil
            proj.atirador = oBoss
			proj.image_angle = bala_direcao
			shot_timer = fire_rate; // Reseta o timer para o próximo disparo
			wait_time = 20
        }
    }
}

// Se o soldado tiver zerado de vida, MORRA!
if vida <= 0{
	can_shoot = false
	
	if morte == 0{
		morte = current_time
		sprite_index = sMechaMorte
	}
	
	var agora = current_time
	if agora - morte >= tempo_espera{
		room_goto(endgame)
		instance_destroy()
	}
}

// Coloca os corações
// Coloca os corações
var coracoes = [c7, c6, c5, c4, c3, c2, c1];
var vida_porcentagem = (vida / max_vida) * 100;

// Calcula o índice com base na porcentagem
var indice = floor((vida_porcentagem / 100) * array_length(coracoes));
indice = clamp(indice, 0, array_length(coracoes) - 1);

oCoracaoMecha.sprite_index = coracoes[indice];

show_debug_message(string(vida_porcentagem))

