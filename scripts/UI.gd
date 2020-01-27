extends Control

onready var pea_count = $CenterContainer/HBoxContainer/HBoxContainer/Pea_Count
onready var key_count = $CenterContainer/HBoxContainer/HBoxContainer2/Key_Count
onready var time_text =$HBoxContainer3/Time_Count
onready var win_text = $"CenterContainer2/YOU WIN"
onready var game_over = false
onready var ui_timer = $Timer
onready var milliseconds_elapsed = 0

func set_pea_count(val):
	pea_count.set_text(str(val))
	pass
	
func set_key_count(val):
	key_count.set_text(str(val))
	pass
	
func show_win():
	game_over = true
	win_text.set("visible",true)
	
func timer():
	if game_over != true:
		if ui_timer.time_left == 0:
			if milliseconds_elapsed < 215999:
				milliseconds_elapsed += 1
				var milliseconds  = milliseconds_elapsed % 60
				var seconds = milliseconds_elapsed % 3600 / 60
				var minutes = milliseconds_elapsed / 3600 % 60
				var str_elapsed = "%02d . %02d . %02d" % [minutes, seconds, milliseconds ]
				time_text.set_text(str_elapsed)
				ui_timer.start()
	
func _process(delta):
	timer()
