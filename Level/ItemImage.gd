class_name ItemImage
extends Node

@export
var _item_name: String :
	set = set_item_name,
	get = get_item_name
	
@export
var _item_texture: Texture2D :
	set = set_item_texture,
	get = get_item_texture

#Setter & Getter Function
func set_item_name(value: String) -> void:
	_item_name = value
	
func get_item_name() -> String:
	return _item_name
	
func set_item_texture(value: Texture2D) -> void:
	_item_texture = value
	
func get_item_texture() -> Texture2D:
	return _item_texture
