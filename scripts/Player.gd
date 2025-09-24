extends CharacterBody2D

@export var speed = 300.0
signal item_collected

func _ready():
	pass

func _physics_process(delta):
	# Obter input do jogador
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction != 0:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed * delta * 3)
	
	# Manter o jogador dentro dos limites da tela
	var screen_size = get_viewport_rect().size
	global_position.x = clamp(global_position.x, 32, screen_size.x - 32)
	
	move_and_slide()

func _on_area_2d_area_entered(area):
	if area and is_instance_valid(area) and area.is_in_group("collectibles"):
		item_collected.emit()
		# Verificar se ainda é válido antes de remover
		if is_instance_valid(area):
			area.queue_free()