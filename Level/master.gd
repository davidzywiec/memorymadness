extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var sd : SelectedLevelData = GameManager.get_selection_level(3)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
