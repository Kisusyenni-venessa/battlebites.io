extends Area2D


func _ready():
	$AnimatedSprite.play("chillibigup")

func _on_chillibigup_body_entered(body):
	if "player" in body.name:
		$pu.play()
		body.chilli_big_up()
		$Timer.start()




func _on_Timer_timeout():
	queue_free()
