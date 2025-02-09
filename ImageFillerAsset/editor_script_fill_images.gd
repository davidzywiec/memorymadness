@tool
extends EditorScript

const PATH : String = "res://assets/glitch/"

# Called when the script is executed (using File -> Run in Script Editor).
func _run() -> void:

	var image_filler_asset = ImageFillerAsset.new()
	
	var dir = DirAccess.open(PATH)
	for file in dir.get_files():
		if file.ends_with(".png"):
			if not image_filler_asset.file_names.has(PATH + file):
				image_filler_asset.file_names.append(PATH + file)
				
	ResourceSaver.save(image_filler_asset,"res://ImageFillerAsset/image_filler_resource.tres")
