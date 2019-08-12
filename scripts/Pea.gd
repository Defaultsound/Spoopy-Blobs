extends Area2D

onready var audio = $AudioStreamPlayer
onready var animation = $AnimationPlayer

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		set_deferred("monitoring", false)
		body.add_pea()
		audio.set("playing",true)
		animation.play("Collect")
	
func remove():
	queue_free()

