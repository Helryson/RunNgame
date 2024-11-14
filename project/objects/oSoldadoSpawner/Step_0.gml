var num_soldados = instance_number(oSoldado)

// Se não tiver o numero maximo de soldados, spawnar
if spawnar and num_max_soldados > num_soldados{
	var xAleatorio = irandom_range(0, room_width)
	var soldado = instance_create_layer(xAleatorio, y, "Main_Layer", oSoldado)
}

//	Vai parar de spawnar assim que chegar no numero maximo
if num_soldados >= num_max_soldados{
	spawnar = false
}
