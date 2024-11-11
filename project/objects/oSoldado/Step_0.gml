// Instancia do player mais próxima

// Distância do player e o soldado
var distancia = x - player_perto.x;

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
    hsp = 0; // Interrompe o movimento horizontal durante a pausa
} else {
    // Controle de movimento e pausa
    if (move_timer > 0) {
        // Se o jogador estiver perto, mover o soldado para ele
        if (distancia < 200 && distancia > 10) {
            hsp = -walkspd; // Move para a esquerda
        }
        else if (distancia > -200 && distancia < -10) {
            hsp = walkspd; // Move para a direita
        }
        move_timer -= 1; // Decrementa o temporizador de movimento
    } 

    // Se o temporizador de pausa estiver ativo, decrementa
    if (pause_timer > 0) {
        pause_timer -= 1; // Decrementa o temporizador de pausa
    } else {
        // Ativar pausa
        hsp = 0; // Interrompe o movimento
        pause_timer = room_speed * 2; // Reinicia o temporizador de pausa (2 segundos)
        move_timer = room_speed * 2; // Reinicia o temporizador de movimento (2 segundos)
    }

    // Se o tempo de espera para disparo estiver ativo, decrementa
    if (shoot_wait_time > 0) {
        shoot_wait_time -= 1; // Decrementa o tempo de espera para disparo
    } else {
        can_shoot = true; // Permite o disparo após a espera
    }
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

// Lógica de disparo
if (can_shoot) {
    if (shot_timer > 0) {
        shot_timer -= 1; // Decrementa o timer
    }

    if (shot_timer <= 0) {
        if (wait_time > 0) {
            wait_time -= 1; // Decrementa o tempo de espera
        } else {
            var proj = instance_create_layer(x, y-(sprite_height/2.5), "Instances", oBalaInimigo);
            proj.direction = direction; // Define a direção do projétil
            shot_timer = fire_rate; // Reseta o timer para o próximo disparo
        }
    }
}

// Se o soldado tiver zerado de vida, MORRA!
if vida <= 0{
	instance_destroy()
}