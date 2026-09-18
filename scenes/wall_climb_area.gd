extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.climb_check = true
		print("entered")
		print(Player.climb_check)


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		body.climb_check = false
		print(Player.climb_check)
