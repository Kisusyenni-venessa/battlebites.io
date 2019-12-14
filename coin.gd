extends Area2D



func _on_coin_body_entered(body):
	
	if body.name == "player":
		get_node("/root/main").score += 25
		$coin.play()
		$Timer.start()
	pass 


func _on_Timer_timeout():
	queue_free()
