//Windows options
if keyboard_check_pressed(vk_f11){
window_set_fullscreen(!window_get_fullscreen());
};

//Get Player Input
var key_left = keyboard_check(ord("A"));
var key_right = keyboard_check(ord("D"));
var key_jump = keyboard_check_pressed(vk_space);
var left_mouse = mouse_check_button(mb_left);

// Atualiza o tempo do tiro
shot_timer -= 1 / room_speed; // Diminui o timer a cada passo

// Cria instância de bala na camada instances_1 quando clica com botão esquerdo
if (left_mouse) {
    if (shot_timer <= 0) { // Verifica se é hora de disparar
        var proj = instance_create_layer(x + 16, y, "Instances_1", oBala);
        proj.direction = direction; // Define a direção do projétil
        shot_timer = 0.2; // Reseta o timer para o próximo disparo
    }
}
//Calculate Movement
var move = key_right - key_left;

hsp = move * walkspd
vsp = vsp + grv;

if(place_meeting(x, y+1, oCenario)) && (key_jump) {
	vsp = -17
}

if key_left
{
    x-=1
	image_xscale = -0.2
	direction = 180
}

if key_right{
	x+=1 
	image_xscale = 0.2
	direction = 0
}


//Horizontal Collision
/* if (place_meeting(x+hsp, y, Object3)){
	while(!place_meeting(x+sign(hsp), y, Object3)){
		x = x + sign(hsp);
	}
	
	hsp = 0;
}*/
x = x + hsp;

// Define o meio do sprite para verificar os limites
var half_width = sprite_width / 2;
var half_height = sprite_height / 2;

// Limite Horizontal - Impede ultrapassar as bordas esquerda e direita
if (x - half_width < 0) {
    x = half_width; // Limite da borda esquerda
} 
else if (x + half_width > room_width) {
    x = room_width - half_width; // Limite da borda direita
}

// Horizontal Limit - Prevents crossing left and right edges
if (x - half_width < 0) {
    x = half_width; // Left edge limit
} 
else if (x + half_width > room_width) {
    x = room_width - half_width; // Right edge limit
}


//Vertical Collision
if (place_meeting(x, y+vsp, oCenario)){
	while(!place_meeting(x, y+sign(vsp), oCenario)){
		y = y + sign(vsp);
	}
	
	vsp = 0;
}
y = y + vsp;

// Vertical Limit - Prevents crossing top and bottom edges
if (y - half_height < 0) {
    y = half_height; // Top edge limit
} 
else if (y + half_height > room_height) {
    y = room_height - half_height; // Bottom edge limit
}

// Colisão com a bala
if (place_meeting(x, y, oBalaInimigo)) {
    var bala = instance_place(x, y, oBalaInimigo); // Encontra a bala em colisão
    if (bala != noone) {
        vida -= 1; // Reduz a saúde do inimigo
        
        // Altera o sprite baseado na vida restante
        switch (vida) {
            case 6: oCoracao.sprite_index = coracao1; break;
            case 5: oCoracao.sprite_index = coracao2; break;
            case 4: oCoracao.sprite_index = coracao3; break;
            case 3: oCoracao.sprite_index = coracao4; break;
            case 2: oCoracao.sprite_index = coracao5; break;
            case 1: oCoracao.sprite_index = coracao6; break;
            case 0: oCoracao.sprite_index = coracao7; break;
        }

        // Destrói a bala após causar dano
        instance_destroy(bala);

        // Verifica se a vida do inimigo chegou a zero
        if (vida <= 0) {
            instance_destroy(); // Destrói o inimigo
        }
    }
}