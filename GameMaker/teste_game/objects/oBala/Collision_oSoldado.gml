// Soldado mais perto
var soldado = instance_nearest(x, y, oSoldado)

// Tira 1 de vida do alvo
soldado.vida -= 1

// Destruir a instância da bala em caso de colisão
instance_destroy()
