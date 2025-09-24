extends Node2D

@export var collectible_scene: PackedScene
@onready var player = $Player
@onready var ui = $UI
@onready var spawn_timer = $SpawnTimer

var game_running = true

func _ready():
	# Carregar a cena do coletável
	collectible_scene = preload("res://scenes/Collectible.tscn")
	
	# Conectar sinais
	player.item_collected.connect(_on_item_collected)
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)
	
	# Configurar o player
	player.add_to_group("player")
	
	# Iniciar o timer de spawn
	spawn_timer.wait_time = 2.0
	spawn_timer.start()

func _input(event):
	if event.is_action_pressed("pause_quit"):
		print("ESC pressionado - game_running: ", game_running)
		if game_running:
			toggle_pause()
		else:
			# Se jogo não está rodando (game over), despausar e ir ao menu
			get_tree().paused = false
			get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")

func toggle_pause():
	print("Toggle pause - paused: ", get_tree().paused)
	if get_tree().paused:
		resume_game()
	else:
		pause_game()

func pause_game():
	print("Pausando jogo")
	
	# Usar pausa real do Godot
	get_tree().paused = true
	
	ui.show_pause()

func resume_game():
	print("Retomando jogo")
	
	# Despausar árvore do Godot
	get_tree().paused = false
	
	ui.hide_pause()

func _on_item_collected():
	print("Item coletado!")
	if game_running and ui and is_instance_valid(ui):
		ui.add_score()
		
		# Acelerar o jogo gradualmente
		if spawn_timer and spawn_timer.wait_time > 0.5:
			spawn_timer.wait_time *= 0.95

func _on_spawn_timer_timeout():
	if game_running:
		spawn_collectible()

func spawn_collectible():
	if not game_running or not collectible_scene:
		return
		
	var collectible = collectible_scene.instantiate()
	if not collectible:
		print("Erro: não foi possível instanciar coletável")
		return
	
	# Verificar se o sinal existe antes de conectar
	if collectible.has_signal("hit_ground"):
		# Desconectar se já estiver conectado para evitar duplicação
		if collectible.hit_ground.is_connected(_on_collectible_hit_ground):
			collectible.hit_ground.disconnect(_on_collectible_hit_ground)
		collectible.hit_ground.connect(_on_collectible_hit_ground)
	
	# Posição aleatória no topo da tela
	var spawn_x = randf_range(50, get_viewport_rect().size.x - 50)
	collectible.global_position = Vector2(spawn_x, -50)
	
	add_child(collectible)
	print("Coletável criado em: ", spawn_x)

func _on_collectible_hit_ground():
	print("Coletável tocou o chão")
	if game_running and ui and is_instance_valid(ui):
		var game_over = ui.lose_life()
		if game_over:
			end_game()

func end_game():
	print("Finalizando jogo...")
	game_running = false
	spawn_timer.stop()
	
	# Pausar o jogo para que os botões do game over funcionem
	get_tree().paused = true
	
	if ui and is_instance_valid(ui):
		ui.show_game_over()
	
	# Remover todos os coletáveis restantes de forma segura
	var collectibles = get_tree().get_nodes_in_group("collectibles")
	for collectible in collectibles:
		if collectible and is_instance_valid(collectible):
			# Desconectar sinais antes de remover
			if collectible.has_signal("hit_ground") and collectible.hit_ground.is_connected(_on_collectible_hit_ground):
				collectible.hit_ground.disconnect(_on_collectible_hit_ground)
			collectible.queue_free()
