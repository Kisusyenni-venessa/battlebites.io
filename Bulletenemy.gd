extends Area2D

const SPEED = 170
var velocity = Vector2()
var direction = 1

func _ready():
	pass

func set_fireball_direction(dir):
	direction = dir 
	if dir == -1:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false

func _physics_process(delta):
	velocity.x = SPEED * delta * direction 
	translate(velocity)
	$AnimatedSprite.play("be")


func _on_Bulletenemy_body_entered(body):
	if "player" in body.name:
		body.dead()
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
