// tamanho dos tiles do grid (celula)
GRID_SIZE = 32;

// definindo o tamanho da sala
//room_width = GRID_SIZE * 80;
//room_height = room_width div 2;

// definindo quantas celulas
CELL_WIDTH = room_width div GRID_SIZE;
CELL_HEIGHT = room_height div GRID_SIZE;

// constantes
GRID_VALUES = {
	WALL: 0,	
	EMPTY: 1,
	PLAYER: 2
};

GRID_DIRECTIONS = {
	N: 1,
	O: 2,
	L: 4,
	S: 8
};

// lendo os tiles usados
tile = layer_tilemap_get_id("DungeonWallTiles")

// criando o grid 
grid = ds_grid_create(CELL_WIDTH, CELL_HEIGHT);

// limpando a grid
ds_grid_clear(grid, GRID_VALUES.WALL);

// mudando a seed
randomize();

var _direction = irandom(3);
var xx = CELL_WIDTH div 2;
var yy = CELL_HEIGHT div 2;
var changeDirection = 1;
var steps = 800;

var playerStep = irandom(steps);


for (var i = 0; i < steps; i++) {
    
	if(irandom(changeDirection)==changeDirection) {
		_direction = irandom(3);
	}
	
	xx += lengthdir_x(1, _direction * 90);
	yy += lengthdir_y(1, _direction * 90);
	
	// limitando o mapa
	xx = clamp(xx, 2, CELL_WIDTH - 2);
	yy = clamp(yy, 2, CELL_HEIGHT - 2);
	
	grid[# xx, yy] = GRID_VALUES.EMPTY;	
	
}

// criando o tile

function calculateTileIndex(i, j) {
	var N = grid[# i, j - 1] == 0;
	var S = grid[# i, j + 1] == 0;
	var L = grid[# i + 1, j] == 0;
	var O = grid[# i - 1, j] == 0;
	return GRID_DIRECTIONS.N * N + GRID_DIRECTIONS.O * O + GRID_DIRECTIONS.L * L + GRID_DIRECTIONS.S * S + 1;
}

for (var i = 0; i < CELL_WIDTH; i++) {
    for (var j = 0; j < CELL_HEIGHT; j++) {
			
		if(grid[# i, j] == GRID_VALUES.WALL) {			
			var tile_index = calculateTileIndex(i, j);		
			tilemap_set(tile, tile_index, i, j);		
		} else {
			tilemap_set(tile, 17, i, j);
		}
			
	}
}

// instanciando objetos

for (var i = 0; i < CELL_WIDTH; i++) {
    for (var j = 0; j < CELL_HEIGHT; j++) {
	    
		if(grid[# i, j] == GRID_VALUES.WALL) {
			instance_create_layer(i  * GRID_SIZE, j * GRID_SIZE, "Instances", obj_wall_1);
		} else if (grid[# i, j] == GRID_VALUES.EMPTY) {
			if(!instance_exists(obj_player)) {
				var xx = i * GRID_SIZE + GRID_SIZE / 2; 
				var yy = j * GRID_SIZE + GRID_SIZE / 2; 			
				instance_create_layer(xx, yy, "Instances", obj_player);
				instance_create_layer(xx, yy, "Instances", obj_camera);
			}
		}
		
	}
}


