extends TextureRect

const SCALE_SMALL : Vector2 = Vector2(0.2,0.2)
const SCALE_NORMAL : Vector2 = Vector2(1.0,1.0)
const SPIN_TIME_RANGE : Vector2 = Vector2(1, 3)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_random_img()
	run_me()


func get_random_img() -> void:
	self.texture = ImageManager.get_random_image()._item_texture

func get_random_time() -> float:
	return randf_range(SPIN_TIME_RANGE.x, SPIN_TIME_RANGE.y)

func get_random_rotation() -> float:
	return rad_to_deg(randf_range(-360,360))

func run_me() -> void:
	#Create tween
	var tween : Tween = get_tree().create_tween()
	#change to small size
	tween.tween_property(self, "scale", SCALE_SMALL, 1)
	#change to random image
	tween.tween_callback(self.get_random_img)
	#change to normal size
	tween.tween_property(self, "scale", SCALE_NORMAL, 1)
	#rotate image
	tween.tween_property(self, "rotation", get_random_rotation(), get_random_time())
	#Call run me again
	tween.tween_callback(self.run_me)
