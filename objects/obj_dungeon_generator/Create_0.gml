// ============== CONSTANTES 

// autotile - bitmasking
GRID_DIRECTIONS = {
	N: 1,
	O: 2,
	L: 4,
	S: 8
};

GRID_DEFAULT_VALUES = {
	WALL: 0,
	PATH: 1,
	PLAYER: 2
};

NUMBER_OF_ENEMYS = 3;
ENEMY_SPAWN_AREA = {
	SLIME: 3,
	SKELETON: 4,
	ZOMBIE: 5
};

ENEMY_SPANW_AREA_MAP = []
for (var enemy = ENEMY_SPAWN_AREA.SLIME; enemy < (ENEMY_SPAWN_AREA.SLIME + NUMBER_OF_ENEMYS); enemy++) {
    array_push(ENEMY_SPANW_AREA_MAP, enemy);
}

//========== Functions
function coordinates_to_grid(i, j) {
	var xx = i * CELL_SIZE + CELL_SIZE / 2; 
	var yy = j * CELL_SIZE + CELL_SIZE / 2;
	return {x: xx, y: yy};
}

function generate_spawn_area(xx, yy, is_player = false) {
	
	if(is_player) {
		ds_grid_set_region(grid, xx - sizeOfRooms, yy - sizeOfRooms, xx + sizeOfRooms, yy + sizeOfRooms, GRID_DEFAULT_VALUES.PLAYER);
		return GRID_DEFAULT_VALUES.PLAYER;
	}
	
	// gero um spawn aleatorio
	var area_spawn = ENEMY_SPANW_AREA_MAP[irandom(NUMBER_OF_ENEMYS - 1)];
	
	// salva no grid o tipo de spawn
	ds_grid_set_region(grid, xx - sizeOfRooms, yy - sizeOfRooms, xx + sizeOfRooms, yy + sizeOfRooms, area_spawn);

	// verifico e coloco o spawner
	if(area_spawn == ENEMY_SPAWN_AREA.SLIME) {	
		var coords = coordinates_to_grid(xx, yy);
		if(!instance_position(coords.x, coords.y, obj_slime_spawner)) {
			enemy_spawner_create(coords.x, coords.y, "Guns", obj_slime_spawner);	
		}
	}
	
	return area_spawn;
}

function clear_spawners_coodinates(xx, yy, radius) {
	
	// limpando spawner
	with (obj_spawner) {
		if (point_distance(x, y, xx, yy) < radius) {
			instance_destroy();
		}
	}
	
	// limpando provaveis inimigos
	with (obj_enemy) {
		if (point_distance(x, y, xx, yy) < radius) {
			instance_destroy();
		}
	}
	
	
}

// ========== Tiles

// lendo os tiles usados
tile = layer_tilemap_get_id("DungeonWallTiles");
tileGround = layer_tilemap_get_id("DungeonGroundTiles");
tileSpawnZone = layer_tilemap_get_id("DungeonSpawnZones");

// ========== Script DUngeon Generator

CELL_SIZE = 32;
GRID_WIDTH = room_width div CELL_SIZE;
GRID_HEIGHT = room_height div CELL_SIZE;
grid = ds_grid_create(GRID_WIDTH, GRID_HEIGHT);
ds_grid_clear(grid, 0);

randomize();

var xx = GRID_WIDTH div 2;
var yy = GRID_HEIGHT div 2;
var randomDirection = irandom(3);
numberOfRooms = 200;
sizeOfRooms = 4;
sizeOfPath = 8;

for (var i = 0; i < numberOfRooms; i++) {
	
    sizeOfRooms = irandom_range(1, 2);
	var path_distance = sizeOfPath * sizeOfRooms * irandom_range(3, 5);
	
	generate_spawn_area(xx, yy);	
	
	while(path_distance > 0) {
		var _p = 4;
		grid[# xx, yy]		= GRID_DEFAULT_VALUES.PATH;
		for(var p = 1; p < _p; p++) {
			grid[# xx, yy + p]	= GRID_DEFAULT_VALUES.PATH;		
			grid[# xx, yy - p]	= GRID_DEFAULT_VALUES.PATH;
			grid[# xx + p, yy]	= GRID_DEFAULT_VALUES.PATH;		
			grid[# xx - p, yy]	= GRID_DEFAULT_VALUES.PATH;
		}

		xx += lengthdir_x(1, randomDirection * 90);
		yy += lengthdir_y(1, randomDirection * 90);
		
		xx  = clamp(xx, 8, GRID_WIDTH - 8);
		yy  = clamp(yy, 8, GRID_HEIGHT - 8);
		
		path_distance--;
	}

	if(path_distance == 0) {
		// seleciona a primeira sala como a area de surgimento do player
		if(i == numberOfRooms - 1) {
			generate_spawn_area(xx, yy, true);
		} else {
			generate_spawn_area(xx, yy);
		}
		randomDirection = irandom(3);
	}

}

// calculando e aplicando o tile

function calculateTileIndex(i, j) {
	var N = grid[# i, j - 1] == 0;
	var S = grid[# i, j + 1] == 0;
	var L = grid[# i + 1, j] == 0;
	var O = grid[# i - 1, j] == 0;
	return	GRID_DIRECTIONS.N * N +
			GRID_DIRECTIONS.O * O +
			GRID_DIRECTIONS.L * L +
			GRID_DIRECTIONS.S * S + 1;
}

for (var i = 0; i < GRID_WIDTH; i++) {
    for (var j = 0; j < GRID_HEIGHT; j++) {
			
		if(grid[# i, j] == GRID_DEFAULT_VALUES.WALL) {			
			var tile_index = calculateTileIndex(i, j);		
			tilemap_set(tile, tile_index, i, j);		
		} else if (grid[# i, j] == GRID_DEFAULT_VALUES.PATH) {
			tilemap_set(tileGround, 17, i, j);
		} else if (grid[# i, j] == GRID_DEFAULT_VALUES.PLAYER) {
			tilemap_set(tileSpawnZone, 1, i, j);
		} else if (grid[# i, j] == ENEMY_SPAWN_AREA.SLIME) {
			tilemap_set(tileSpawnZone, 2, i, j);
		} else if (grid[# i, j] == ENEMY_SPAWN_AREA.SKELETON) {
			tilemap_set(tileSpawnZone, 3, i, j);
		} else if (grid[# i, j] == ENEMY_SPAWN_AREA.ZOMBIE) {
			tilemap_set(tileSpawnZone, 4, i, j);
		}
		
		if(grid[# i, j] !=  GRID_DEFAULT_VALUES.WALL) {
			tilemap_set(tileGround, 17, i, j);
		}
		
	}
}

// instanciando objetos

for (var i = 0; i < GRID_WIDTH; i++) {
    for (var j = 0; j < GRID_HEIGHT; j++) {
	    
		switch(grid[# i, j])
		{
			case GRID_DEFAULT_VALUES.WALL: {
				instance_create_layer(i  * CELL_SIZE, j * CELL_SIZE, "Instances", obj_wall_1);
			} break;
			case GRID_DEFAULT_VALUES.PLAYER: {
								
				if(!instance_exists(obj_player)) {
					
					var coords = coordinates_to_grid(i+2, j+2);
										
					instance_create_layer(coords.x, coords.y, "Instances", obj_player);
					instance_create_layer(coords.x, coords.y, "Instances", obj_camera);
					
					clear_spawners_coodinates(coords.x, coords.y, 100);

					
				}
			} break;
						
		}
		
	}
}


// criando o mapa de colisões

mp_grid = mp_grid_create(0, 0, GRID_WIDTH, GRID_HEIGHT, CELL_SIZE, CELL_SIZE);
mp_grid_add_instances(mp_grid, obj_wall_1, false);