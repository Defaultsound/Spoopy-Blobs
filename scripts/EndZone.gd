extends Area2D
onready var pea_count = get_tree().get_nodes_in_group("Pea").size()

func _ready():
	print(str(pea_count))
	pass


func _on_EndZone_body_entered(body):
	if body.name == "Player":
		if body.peas == pea_count:
			body.UI.show_win()
			print("YOU WIN")
		else:
			print("KEEP TRYING")
	pass # Replace with function body.
