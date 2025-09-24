extends Area2D

@export var fall_speed = 200.0
signal hit_ground

func _ready():
	pass

func _physics_process(delta):
	# Verificar se ainda está válido
	if not is_inside_tree():
		return
		
	# Movimento simples para baixo
	global_position.y += fall_speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	# Verificar se ainda está válido
	if not is_inside_tree():
		return
		
	# Emitir sinal se saiu pela parte inferior
	if global_position.y > 0:
		hit_ground.emit()
	queue_free()