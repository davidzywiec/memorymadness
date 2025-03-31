extends Control

@onready var quit_btn : TextureButton = $HBoxContainer/MC2/VBC/QuitButton
@onready var grid_container : GridContainer = $HBoxContainer/MC/GC
@onready var moves_label : Label = $HBoxContainer/MC2/VBC/HBCScore/MovesCount
@onready var pairs_label : Label = $HBoxContainer/MC2/VBC/HBCPairs/PairsCount
@onready var game_over_ui : Control = $GameOverUI
#Instance for Image Tile
var image_tile_prefab = preload("res://UI/image_tile.tscn")

var _level_selected : SelectedLevelData
var _pairs_found: int = 0
var _moves_made: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	quit_btn.pressed.connect(quit_game_pressed)
	SignalManager.on_level_select.connect(on_level_selected)
	SignalManager.pair_found.connect(game_over)
	SignalManager.on_tile_selected.connect(tile_selected)

func quit_game_pressed() -> void:
	SignalManager.on_game_exit_pressed.emit()
	reset_level()

func on_level_selected(level: int):
	reset_level()
	_level_selected = GameManager.get_selection_level(level)
	grid_container.columns = _level_selected.get_num_cols()
	
	for ld in _level_selected._selected_level_images:
		add_tile_image(ld.get_item_texture(), ld.get_item_name())
		
	update_score_labels()
	
func add_tile_image(image : Texture2D, tile_name: String) -> void:
	var tile : ImageTile  = image_tile_prefab.instantiate()
	grid_container.add_child(tile)
	tile.setup_tile(ImageManager.get_random_frame(),
					image,
					tile_name
					)

func reset_level() -> void:	
	for c in grid_container.get_children():
		c.queue_free()
	_moves_made = 0
	_pairs_found = 0
	game_over_ui.visible = false
	
func game_over() -> void:
	_pairs_found += 1
	update_score_labels()
	if _pairs_found == _level_selected._target_pairs:
		game_over_ui.visible = true
		game_over_ui.update_scores("%d/%d" % [_pairs_found,_level_selected.get_target_pairs()])

func update_score_labels() -> void:
	pairs_label.text = "%d/%d" % [_pairs_found,_level_selected.get_target_pairs()]
	moves_label.text = str(_moves_made)

func tile_selected(tile: ImageTile) -> void:
	_moves_made += 1
	update_score_labels()
