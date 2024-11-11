/// @description Platform collision detection
// Get all instances of player within range

// Check if the player is on top of any platform
var on_any_platform = false;

// Loop through all instances of platforms
with (oPlataforma) {
    // Vertical collision check
    if ((player.y >= y - global.vsp_player && player.y <= y + global.vsp_player && player.x + 32 >= x - 32 && player.x - 32 <= x + 32) or (player.x + 32 >= x - 32 && player.x - 32 <= x + 32)) {
        // Horizontal collision check
        player.y_inicial = y;
        on_any_platform = true;  // Player is on a platform
	}
}

// If the player is not on any platform, reset the ground level
if (!on_any_platform) {
    player.y_inicial = player_inicial_y;
}
