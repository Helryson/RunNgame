/// @description Insert description here
// You can write your code in this editor

// Instancia do player mais proxima
var player_perto = instance_nearest(x, y, OMarco)

// Distancia do plaayer e o soldado
var distancia = x - player_perto.x

// Se o player tiver perto, C O L I D I R!

if distancia < 200 and distancia > 10{
	x -= velocidade
	image_xscale = 0.2470145
}
else if distancia > -200 and distancia < -10{
	image_xscale = -0.2470145
	x += velocidade
}
	
// Aqui é para manter o soldado com o xscale certo
if distancia < 0{
	image_xscale = -0.2470145
}else{
	image_xscale = 0.2470145
}