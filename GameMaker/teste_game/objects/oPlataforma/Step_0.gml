/// @description Platform collision detection
// Get all instances of player within range
var list = ds_list_create();
var count = collision_rectangle_list(
    x - 32, y - global.vsp_player,
    x + 32, y + global.vsp_player,
    OMarco, false, true, list, false
);

// Check each instance in range
for (var i = 0; i < count; i++) {
    var player = list[| i];
    
    // Vertical collision check
    if (player.y >= y - global.vsp_player && player.y <= y + global.vsp_player) {
        // Horizontal collision check
        if (player.x + 32 >= x - 32 && player.x - 32 <= x + 32) {
            player.y_inicial = y;
        }
    }
    
    // Check if player left the platform
    if (player.x - 32 > x + 32 || player.x + 32 < x - 32) {
        player.y_inicial = player_inicial_y;
    }
}

// Clean up
ds_list_destroy(list);