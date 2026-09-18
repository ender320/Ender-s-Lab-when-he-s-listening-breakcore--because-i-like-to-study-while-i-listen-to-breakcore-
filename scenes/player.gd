extends CharacterBody2D

var speed = 300
var jumph = -400
var grab_check = false
var climb_check = false
var climb_allow = false
var mov_check = true
var gravity_check = true

func _process(delta: float) -> void:
	player_mov() 
	character_gravity(delta)
	wall_run()
	move_and_slide()

func player_mov():
	if mov_check == true and climb_allow == false:
		velocity.x = speed * Input.get_axis("ui_left", "ui_right")
	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y = jumph
func wall_run():
	if climb_check == true and Input.is_action_pressed("Grab"):
		climb_allow = true
	else:
		climb_allow =  false
		gravity_check = true
		mov_check = true

	if climb_allow == true:
		gravity_check = false
		mov_check = false
		print("pode agarrar")
		velocity.y = 0
		velocity.x = 400
func character_gravity(delta):
	if not is_on_floor() and gravity_check == true:
		velocity += get_gravity() * delta 
