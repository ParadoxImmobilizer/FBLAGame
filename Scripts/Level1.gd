extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var doorStat = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	$Camera2D.current = true
	$EnterAmination.play("open")
	doorStat = "open"


func _on_EnterAmination_animation_finished():
	if doorStat == "open":
		$EnterAmination.play("close")
		doorStat == "close"
	elif doorStat == "close":
		$EnterAnimation.play("lock")
		doorStat == "lock"
	else:
		$CollisionBodyContainer/CollisionDoor.disabled = false
