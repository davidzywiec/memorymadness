extends Node

signal on_game_exit_pressed
signal on_level_select(level: int)
signal on_tile_selected(tile: ImageTile)
signal on_tile_deselected(tile: ImageTile)
signal toggle_tile_selection(flag: bool)
signal pair_found
