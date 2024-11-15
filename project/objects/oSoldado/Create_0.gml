/// @description Insert description here
// You can write your code in this editor

//Velocidade do soldado

// Define o Y como o mesmo do player NA CRIAÇÃO
player_perto = instance_nearest(x, y, OMarco) // O player mais próximo do soldado
y = player_perto.y

hsp = 0;
vsp = 0;
grv = 0.75;
walkspd = 2;
espera = 0;
pause_timer = 0; // Novo temporizador para pausar
pause_duration = room_speed * 2; // Duração da pausa em frames (2 segundos)


vida = 10; // Inicializa a saúde do inimigo
shot_timer = 0; // Timer inicial
wait_time = 120; // 2 segundos (a 60 FPS)
fire_rate = 100; // 1 segundo (a 60 FPS)
can_shoot = true; // Permite disparar inicialmente
shoot_wait_time = 0; // Inicializa o tempo de espera para disparo
dano_player = global.dano_armas[1] // Mesmo dano da AK-47

// Variáveis para controle de parada
move_timer = 0; // Timer para controle de movimento
move_duration = room_speed * 2; // Duração do movimento (2 segundos)
stop_duration = room_speed * 2; // Duração da parada (2 segundos)
is_moving = true; // Flag para indicar se está se movendo
