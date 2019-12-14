extends Area2D
export(String, FILE, "*tscn") var target_stage


func _ready():
	pass
	

func _on_portal_body_entered(body):
	if "player" in body.name:
		$in.play()
		get_tree().change_scene(target_stage)
