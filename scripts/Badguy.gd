extends Area2D

export(String) var group_name
onready var waypointparent = get_tree().get_nodes_in_group(group_name)
onready var waypoints = waypointparent[0].get_children()
onready var Timer = $Timer
onready var anim = $Animation
var i = 0
var val = 0
var speed = 0.01

func _ready():
	$Animation.play("Move")
	pass


func _process(delta):

	if i + 1 == waypoints.size():
		waypoints.invert()
		i = 0
	val += speed
	val = clamp(val,0.0,1.0)
	self.position.x = lerp(round(self.position.x),round(waypoints[i].position.x),val)
	self.position.y = lerp(round(self.position.y),round(waypoints[i].position.y),val)
	if Timer.time_left == 0:
		i += 1
		val = 0
		Timer.start()

	pass

	

func _on_Badguy_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()
	pass # Replace with function body.
