extends Area2D

func _ready():
	pass


func _on_Key_body_entered(body):
	if body.name == "Player":
		set_deferred("monitoring", false)
		body.add_key()
		$AnimationPlayer.play("KeyGet")
		$AudioStreamPlayer.set("playing",true)
	pass # Replace with function body.

func remove():
	queue_free()
	pass