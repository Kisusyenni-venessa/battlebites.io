extends KinematicBody2D

const GRAVITY = 10
const FLOOR = Vector2(0,1)

var velocity = Vector2()
var direction = 1

var is_dead = false

export(int) var SPEED = 70
export(int) var hp = 5

export(Vector2) var size = Vector2(1, 1)

func _ready():
	scale = size
	pass
	
func dead(damage):
	hp = hp - damage
	if hp <= 0:
		is_dead = true
		velocity = Vector2(0,0)
		$AnimatedSprite.play("dead")
		$wasted.play()
		$CollisionShape2D.call_deferred("set_disabled",true)
		$Timer.start()


func _physics_process(delta):
	if is_dead == false:
		velocity.y = SPEED * direction
	
		if direction == 1:
			$AnimatedSprite.flip_h = false
		
		$AnimatedSprite.play("float")
			
			
	
		velocity.y += GRAVITY
		
	
		
	
		velocity = move_and_slide(velocity, FLOOR)
	
	if is_on_ceiling():
		direction = direction * -1
	if is_on_floor():
		direction = direction * -1

		
	if get_slide_count() > 0:
		for i in range(get_slide_count()):
			if "player" in get_slide_collision(i).collider.name:
				get_slide_collision(i).collider.dead()


func _on_Timer_timeout():
	queue_free()
