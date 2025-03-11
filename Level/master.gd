extends CanvasLayer

@onready var main_menu_scene = $Main
@onready var game_scene = $Game

func _ready() -> void:
	SignalManager.on_game_exit_pressed.connect(on_game_exit_pressed)
	SignalManager.on_level_select.connect(on_level_selected)
	
func show_game(s: bool) -> void:
	game_scene.visible = s
	main_menu_scene.visible = !s
	
func on_game_exit_pressed() -> void:
	show_game(false)
	
func on_level_selected(level : int) -> void:
	show_game(true)
