extends KinematicBody2D

var peas = 0
var keys = 0
var sound1 = load("res://sounds/Rise02.wav")
var sound2 = load("res://sounds/Rise01.wav")
onready var sprite = $Sprite
onready var audio = $AudioStreamPlayer
onready var UI = get_tree().get_nodes_in_group("UI")[0]

func _physics_process(delta):
	if Input.is_action_just_pressed("move_up"):
		move(Vector2(0,-80),0)
	if Input.is_action_just_pressed("move_down"):
		move(Vector2(0,80),4)
	if Input.is_action_just_pressed("move_left"):
		move(Vector2(-80,0),1)
	if Input.is_action_just_pressed("move_right"):
		move(Vector2(80,0),5)


func move(direction,dex):
	animate(dex)
	audio.set("stream",sound1)
	audio.set("playing",true)
	var collision = move_and_collide(direction,false,true,false)
	if collision:
		if collision.get_collider().is_in_group("Door"):
			if keys > 0:
				collision.get_collider().queue_free()
				keys -= 1
				UI.set_key_count(keys)
		audio.set("stream",sound2)
		audio.set("playing",true)


func animate(idex):
	sprite.frame = idex

func add_key():
	keys += 1
	UI.set_key_count(keys)
	
func add_pea():
	peas += 1
	UI.set_pea_count(peas)
	