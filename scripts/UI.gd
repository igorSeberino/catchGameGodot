extends CanvasLayer

@onready var score_label = $ScoreLabel
@onready var lives_label = $LivesLabel
@onready var game_over_panel = $GameOverPanel
@onready var final_score_label = $GameOverPanel/GameOverBox/FinalScoreLabel
@onready var menu_button = $GameOverPanel/GameOverBox/MenuButton
@onready var restart_button = $GameOverPanel/GameOverBox/RestartButton
@onready var pause_panel = $PausePanel

var score = 0
var lives = 3

func _ready():
	print("UI iniciando...")
	if game_over_panel:
		game_over_panel.visible = false
	if pause_panel:
		pause_panel.visible = false
	update_display()
	print("UI pronto!")

func add_score(points = 1):
	score += points
	update_display()

func lose_life():
	lives -= 1
	update_display()
	return lives <= 0

func update_display():
	score_label.text = "Score: " + str(score)
	lives_label.text = "Vidas: " + str(lives)

func show_game_over():
	game_over_panel.visible = true
	final_score_label.text = "PONTUAÇÃO FINAL: " + str(score)

func show_pause():
	print("Mostrando menu de pausa")
	if pause_panel:
		pause_panel.visible = true
	else:
		print("ERRO: pause_panel não encontrado")

func hide_pause():
	if pause_panel:
		pause_panel.visible = false

func reset_game():
	score = 0
	lives = 3
	update_display()
	game_over_panel.visible = false

func _on_menu_button_pressed():
	print("Botão menu pressionado")
	# Despausar antes de trocar cena
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")

func _on_restart_button_pressed():
	print("Botão reiniciar pressionado")
	# Despausar antes de recarregar cena
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_resume_button_pressed():
	print("Botão continuar pressionado")
	var main = get_tree().current_scene
	if main and main.has_method("resume_game"):
		main.resume_game()

func _on_quit_button_pressed():
	print("Botão quit pressionado")
	# Despausar antes de trocar cena
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
