extends Control

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")

func _input(event):
	if event.is_action_pressed("pause_quit"):
		get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")