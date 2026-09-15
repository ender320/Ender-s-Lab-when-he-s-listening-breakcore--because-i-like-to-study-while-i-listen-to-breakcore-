extends CharacterBody2D

var speed = 300
var jumph = -400
var grab_check = false

func _process(delta: float) -> void:
	player_mov() 
	left_grab_state()
	right_grab_state()
	character_gravity(delta) #eu só taquei isso aqui pq funciona KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK

func player_mov():
	velocity.x = speed * Input.get_axis("ui_left", "ui_right")
	move_and_slide()
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y = jumph

func left_grab_state():
	if Input.is_action_pressed("ui_left") and not is_on_floor() and $Left_Grab.is_colliding():
		grab_check = true
	else:  
		grab_check = false
	if grab_check == true:
		velocity.y = 50

func right_grab_state():
	if Input.is_action_pressed("ui_right") and not is_on_floor() and $Right_Grab.is_colliding():
		grab_check = true
	else:  
		grab_check = false
	if grab_check == true:
		velocity.y = 50

func character_gravity(delta):
	if not is_on_floor() and grab_check == false:
		velocity += get_gravity() * delta 
