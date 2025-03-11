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
	self.pressed.connect(select_level_pressed)


func select_level_pressed() -> void:
	SignalManager.on_level_select.emit(level_num)
