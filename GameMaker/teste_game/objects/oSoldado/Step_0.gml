/// @description Insert description here
// You can write your code in this editor

// Instancia do player mais proxima
var player_perto = instance_nearest(x, y, OMarco)

// Distancia do plaayer e o soldado
var distancia = x - player_perto.x

// Se o player tiver perto, C O L I D I R!

// Verifica mudança de direção e pausa o movimento por 0.3 segundos
var nova_direcao = (distancia < 0) ? -0.2608365 : 0.2608365;
if (image_xscale != nova_direcao) {
    image_xscale = nova_direcao;
    espera = room_speed * 0.3; // Define espera de 0,3 segundos (room_speed é a taxa de FPS)
}

// Se o temporizador estiver ativo, decrementa e pausa o movimento
if (espera > 0) {
    espera -= 1; // Decrementa o temporizador
    hsp = 0; // Interrompe o movimento horizontal durante a pausa
} else {
    // Se o jogador estiver perto, mover o soldado para ele
    if (distancia < 200 && distancia > 10) {
        hsp = -walkspd; // Move para a esquerda
    }
    else if (distancia > -200 && distancia < -10) {
        hsp = walkspd; // Move para a direita
    }
}

//Horizontal Collision
if (place_meeting(x+hsp, y, Object3)){
	while(!place_meeting(x+sign(hsp), y, Object3)){
		x = x + sign(hsp);
	}
	
	hsp = 0;
}
x = x + hsp;

//Vertical Collision
vsp += grv

if (place_meeting(x, y+vsp, oCenario)){
	while(!place_meeting(x, y+sign(vsp), oCenario)){
		y = y + sign(vsp);
	}
	
	vsp = 0;
}
y = y + vsp;