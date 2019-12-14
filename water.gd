extends Area2D




func _ready():
	pass 


func _on_water_body_entered(body):
	if body.name == "player":
		get_node("../player").dead()
