// Instancia do player mais próxima


// Distância do player e o soldado
var distancia = x - player_perto.x;

// Calcular o angulo entre o x, y do player e o x, y do boss
var bala_direcao = radtodeg(arctan2((y-player_perto.y), (player_perto.x-x)))
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
if instance_number(oLimite) >= 1{
	var limite_proximo = instance_nearest(x, y, oLimite) // O objeto de limite mais proximo
	var distancia_limiteX = x - limite_proximo.x // A distancia do x do player do x do objeto de limite
	var distancia_borda_limiteX = 0 // A distancia da borda do limite
	
	if distancia_limiteX < 0{
		// Calculo da distancia da borda do limite mais proximo caso a distancia do ponto origem do limite for menor que zero
		distancia_borda_limiteX = distancia_limiteX + limite_proximo.sprite_width/2
	}else if distancia_limiteX > 0{
		// Caso for maior que zero
		distancia_borda_limiteX = distancia_limiteX - limite_proximo.sprite_width/2
	}	
	if distancia_borda_limiteX < 10 and distancia_borda_limiteX >= 0{
		x += 3
	}else if distancia_borda_limiteX > -10 and distancia_borda_limiteX <= 0{
		x -= 3
	}
}

if (can_shoot) {
    if (shot_timer > 0) {
        shot_timer -= 1; // Decrementa o timer
    }

    if (shot_timer <= 0) {
        if (wait_time > 0) {
            wait_time -= 1; // Decrementa o tempo de espera
        } else {
            var proj = instance_create_layer(x, y-(sprite_height/2.5), "Instances", oBalaInimigo);
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
	room_goto(endgame)
	instance_destroy()
}