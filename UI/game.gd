extends Control

@onready var quit_btn : TextureButton = $HBoxContainer/MC2/VBC/QuitButton
@onready var grid_container : GridContainer = $HBoxContainer/MC/GC

#Instance for Image Tile
var image_tile_prefab = preload("res://UI/image_tile.tscn")

var _level_selected : SelectedLevelData

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	quit_btn.pressed.connect(quit_game_pressed)
	SignalManager.on_level_select.connect(on_level_selected)

func quit_game_pressed() -> void:
	SignalManager.on_game_exit_pressed.emit()
	reset_level()

func on_level_selected(level: int):
	_level_selected = GameManager.get_selection_level(level)
	grid_container.columns = _level_selected.get_num_cols()
	
	for ld in _level_selected._selected_level_images:
		add_tile_image(ld.get_item_texture(), ld.get_item_name())
	
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
