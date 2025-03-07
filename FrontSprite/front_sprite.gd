extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_random_img()


func get_random_img() -> void:
	self.texture = ImageManager.get_random_image()._item_texture
