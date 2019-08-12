extends Control

onready var pea_count = $CenterContainer/HBoxContainer/HBoxContainer/Pea_Count
onready var key_count = $CenterContainer/HBoxContainer/HBoxContainer2/Key_Count
onready var win_text = $"CenterContainer2/YOU WIN"

func set_pea_count(val):
	pea_count.set_text(str(val))
	pass
	
func set_key_count(val):
	key_count.set_text(str(val))
	pass
	
func show_win():
	win_text.set("visible",true)	