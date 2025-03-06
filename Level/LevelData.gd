class_name LevelData

var _level_number: int = 0:
	set = set_level_number,
	get = get_level_number
	
var _rows: int = 0:
	set = set_rows,
	get = get_rows
	
var _columns: int = 0:
	set = set_columns,
	get = get_columns

func _init(level_number: int, rows: int, columns: int) -> void:
	_level_number = level_number
	_rows = rows
	_columns = columns

#Getter and Setter Functions
func set_level_number(value: int) -> void:
	_level_number = value
	
func get_level_number() -> int:
	return _level_number

func set_rows(value: int) -> void:
	_rows = value

func get_rows() -> int:
	return _rows
	
func set_columns(value: int) -> void:
	_columns = value

func get_columns() -> int:
	return _columns

#Support functions
func get_target_pairs() -> int:
	return int((_rows * _columns) / 2)
