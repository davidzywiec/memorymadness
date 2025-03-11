extends TextureButton

class_name ImageTile

@onready var _frame_image : TextureRect = $FrameImage
@onready var _item_image : TextureRect = $ItemImage

var _item_name : String
var _can_be_selected: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect(item_pressed)

func setup_tile(frame : Texture2D
				, image: Texture2D
				, item_name: String) -> void:
	_item_name = item_name
	_frame_image.texture = frame
	_item_image.texture = image

func reveal(r: bool) -> void:
	_frame_image.visible = true
	_item_image.visible = true

func item_pressed() -> void:
	if _can_be_selected:
		reveal(true)
