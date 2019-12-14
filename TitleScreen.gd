extends Node


func _ready():
	$MarginContainer/VBoxContainer/start.grab_focus()

func _physics_process(delta):
	if $MarginContainer/VBoxContainer/start.is_hovered() == true:
		$MarginContainer/VBoxContainer/start.grab_focus()
	if $MarginContainer/VBoxContainer/quit.is_hovered() == true:
		$MarginContainer/VBoxContainer/quit.grab_focus()

func _on_start_pressed():
	get_tree().change_scene("level1.tscn")

func _on_quit_pressed():
	get_tree().quit()


func _on_tutorial_pressed():
	get_tree().change_scene("Tutorial.tscn")


func _on_levels_pressed():
	get_tree().change_scene("chooselevel.tscn")
