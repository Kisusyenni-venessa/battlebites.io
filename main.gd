extends Node2D

var score = 0 setget set_score

func set_score(value):
	score = value
	get_node("/root/main/HUD/score").set_text("SCORE: "+str(score))

	if score < 0:
		get_tree().change_scene("res://GameOver.tscn")
		get_node("/root/main").score = 0


func _on_Timer_timeout():
	get_tree().reload_current_scene()



		
