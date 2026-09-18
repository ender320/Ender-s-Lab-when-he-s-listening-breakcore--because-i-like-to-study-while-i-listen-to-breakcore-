extends CharacterBody2D


var speed = 500
var contact_right = false


func _physics_process(delta: float) -> void:
	pass
	if contact_right == true:
		velocity.x = speed
	
	move_and_slide()
