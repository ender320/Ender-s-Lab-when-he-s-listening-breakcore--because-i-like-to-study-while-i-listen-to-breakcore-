extends Camera3D

# Variáveis configuráveis no Inspetor
@export var raio: float = 5.0       # Tamanho do círculo
@export var velocidade: float = 0.5 # Velocidade do movimento

var tempo: float = 0.0

func _process(delta):
	# Acumula o tempo decorrido
	tempo += delta * velocidade
	
	# Calcula as novas posições X e Z usando seno e cosseno
	var x: float = cos(tempo) * raio
	var z: float = sin(tempo) * raio
	rotate_y(-0.2 * delta)
	rotate_x(-0.2 * delta)
	
	# Aplica a nova posição (mantendo a altura Y original)
	position = Vector3(x, position.y, z)
