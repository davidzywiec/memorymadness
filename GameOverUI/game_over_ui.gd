extends Control
class_name game_over_ui

@onready var quit_btn : TextureButton = $TextureRect/MC/VBC/TextureButton
@onready var score_lbl : Label = $TextureRect/MC/VBC/ScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	quit_btn.pressed.connect(exit_game)

func exit_game() -> void:
	SignalManager.on_game_exit_pressed.emit()

func update_scores(score_label: String) -> void:
	score_lbl.text = score_label
