extends Node

@onready var timer : Timer = $Timer

var _selected_tiles : Array[ImageTile] = []
var _selected_pairs : Array[ImageTile] = []
var _can_select_tiles : bool = false
var _pair_cnt : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_tile_selected.connect(tile_selected)
	timer.timeout.connect(check_pair)
	
func tile_selected(tile: ImageTile) -> void:
	_selected_tiles.append(tile)
	if _selected_tiles.size() == 2:
		toggle_select_tiles(false)
		timer.start()
		
		
func toggle_select_tiles(flag: bool) -> void:
	_can_select_tiles = flag
	SignalManager.toggle_tile_selection.emit(flag)
	
func reset_tiles(paired: bool) -> void:
	if !paired:
		for x in _selected_tiles:
			x.reveal(false)
	else:
		for x in _selected_tiles:
			x._paired = true
	_selected_tiles.clear()
	toggle_select_tiles(true)


func check_pair() -> void:
	if _selected_tiles.size() == 2:
		if _selected_tiles[0]._item_name == _selected_tiles[1]._item_name:
			_selected_pairs.append_array(_selected_tiles)
			reset_tiles(true)
			SignalManager.pair_found.emit()
			pass
			
	reset_tiles(false)
