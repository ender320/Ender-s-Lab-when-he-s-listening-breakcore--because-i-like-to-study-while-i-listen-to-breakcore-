extends CharacterBody2D

var speed = 300
var jumph = -400
var grab_check = false

func _process(delta: float) -> void:
	player_mov() 
	grab_state()
	if not is_on_floor() and grab_check == false:
		velocity += get_gravity() * delta 

func player_mov():
	velocity.x = speed * Input.get_axis("ui_left", "ui_right")

	move_and_slide()
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y = jumph

func grab_state():
	if Input.is_action_pressed("ui_left") and not is_on_floor() and $RayCast2D.is_colliding():
		grab_check = true
	else:  
		grab_check = false
	if grab_check == true:
		velocity.y = 50
