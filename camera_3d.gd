extends Camera3D

# Variáveis configuráveis no Inspetor
@export var raio: float = 5.0       # Tamanho do círculo
@export var velocidade: float = 0.5 # Velocidade do movimento

var tempo: float = 0.0

func _process(delta):
	tempo += delta * velocidade
	
	var x: float = cos(tempo) * raio
	var z: float = sin(tempo) * raio
	rotate_y(-0.2 * delta)
	rotate_x(-0.2 * delta)
		
	position = Vector3(x, position.y, z)
