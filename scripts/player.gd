extends KinematicBody2D

export var speed := 100
export var jump := -200
export var gravity := 500
var direction := Vector2()
var jumping := false

func _physics_process(delta):
	direction.x = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) * speed
	
	if Input.is_action_just_pressed("ui_select") and is_on_floor():
		jumping = true
		direction.y = jump
	direction.y += gravity * delta
	if jumping and is_on_floor():
		jumping = false
	
	if direction.x > 0:
		$player_sprite.playing = true
		$player_sprite.flip_h = true
	elif direction.x < 0:
		$player_sprite.playing = true
		$player_sprite.flip_h = false
	elif direction.x == 0:
		$player_sprite.playing = false

	move_and_slide(direction, Vector2(0, -1))
