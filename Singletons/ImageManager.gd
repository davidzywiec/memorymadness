extends Node

const FRAME_IMAGES : Array[Texture2D] = [
	preload("res://assets/frames/blue_frame.png"),
	preload("res://assets/frames/green_frame.png"),
	preload("res://assets/frames/red_frame.png"),
	preload("res://assets/frames/yellow_frame.png")
]

var _image_list_array : Array[ItemImage] = []

func _ready() -> void:
	var img_resource : ImageFillerAsset = load("res://ImageFillerAsset/image_filler_resource.tres")
	for img in img_resource.file_names:
		add_item_image(img)
	pass

#Add image into the Item Image Array (_image_list_array)
func add_item_image(file_name: String) -> void:
	var item_image = ItemImage.new(file_name.get_file().get_basename(), load(file_name))
	_image_list_array.append(item_image)

#Pick a random Item Image from the item images array
func get_random_image() -> ItemImage:
	return _image_list_array.pick_random()

#Pick a random frame from the frame images array
func get_random_frame() -> Texture2D:
	return FRAME_IMAGES.pick_random()
	
#Pick an image based on the index in the item images array
func get_item_image(index: int) -> ItemImage:
	return _image_list_array[index]

func shuffle_images() -> void:
	_image_list_array.shuffle()
