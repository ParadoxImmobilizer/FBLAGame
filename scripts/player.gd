extends KinematicBody2D

export var speed := 100
export var gravity := 100

func _physics_process(delta):
	var direction := Vector2()
	direction.x = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"))
	direction.y = $gravity * 1

	if direction.x > 0:
		$player_sprite.playing = true
		$player_sprite.flip_h = true
	elif direction.x < 0:
		$player_sprite.playing = true
		$player_sprite.flip_h = false
	elif direction.x == 0:
		$player_sprite.playing = false

	move_and_collide(speed * direction * delta)
