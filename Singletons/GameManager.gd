extends Node

@onready
var _level_data : Dictionary = {
	1 : LevelData.new(1,2,2),
	2 : LevelData.new(2,3,4),
	3 : LevelData.new(3,3,4),
	4 : LevelData.new(4,4,6),
	5 : LevelData.new(5,6,6),
	6 : LevelData.new(6,6,7)
}

func get_level_data(level: int) -> LevelData:
	return _level_data[level]

func get_level_count() -> int:
	return _level_data.keys().size()

func get_selection_level(level: int) -> SelectedLevelData:
	#Get current level data
	var ld : LevelData = _level_data[level]
	#Create an image array to hold the images to use in the level
	var image_array : Array[ItemImage] = []
	#Shuffle images to be unique each game
	ImageManager.shuffle_images()
	#Loop through the Images and add them to image_array
	for img in range(ld.get_target_pairs()):
		#Add image twice for the pair
		for x in range(2):
			image_array.append(ImageManager.get_item_image(img))
	print(image_array)
	#Return instance of Selected Level Data
	return SelectedLevelData.new(
		image_array,
		ld.get_target_pairs(),
		ld._columns
	)
