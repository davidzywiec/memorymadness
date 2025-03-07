extends TextureButton

@export var level_num : int = 1

@onready var _label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var ld : LevelData = GameManager.get_level_data(level_num)
	_label.text = "%dx%d" % [
		ld._rows,
		ld._columns
	]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
