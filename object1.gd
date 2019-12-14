extends RigidBody2D

var picked = false


func _input(event):
	if Input.is_action_just_pressed("e"):
		var bodies = $detector.get_overlapping_bodies()
		for b in bodies:
			if body.name == "player" and picked == false:
				picked == true
				
