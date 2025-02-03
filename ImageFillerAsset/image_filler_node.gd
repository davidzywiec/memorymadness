extends Node

const PATH : String = "res://assets/glitch/"

@export var filler_resource : ImageFillerAsset


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var image_filler_asset = ImageFillerAsset.new()
	
	var dir = DirAccess.open(PATH)
	for file in dir.get_files():
		if file.ends_with(".png"):
			if not image_filler_asset.file_names.has(PATH + file):
				image_filler_asset.file_names.append(PATH + file)
	ResourceSaver.save(image_filler_asset,"res://ImageFillerAsset/image_filler_resource.tres")
