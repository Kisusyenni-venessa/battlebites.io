extends Area2D


func _ready():
	$AnimatedSprite.play("chilli")

func _on_chilli_body_entered(body):
	if "player" in body.name:
		$pu.play()
		body.chilli_power_up()
		$Timer.start()
		


func _on_Timer_timeout():
	queue_free()
