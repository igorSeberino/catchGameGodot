extends Control

func _ready():
	# Garantir que o mouse esteja visível
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Main.tscn")

func _on_instructions_button_pressed():
	get_tree().change_scene_to_file("res://scenes/Instructions.tscn")

func _on_quit_button_pressed():
	get_tree().quit()

func _input(event):
	if event.is_action_pressed("pause_quit"):
		get_tree().quit()