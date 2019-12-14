extends KinematicBody2D


const SPEED = 110
const GRAVITY = 10
const JUMP_POWER = -250
const FLOOR = Vector2(0, -1)

const FIREBALL = preload("res://Fireball.tscn")
const FIREBALLRED = preload("res://FireballRed.tscn")
const FIREBIGUP = preload("res://FireballBig.tscn")

var velocity = Vector2()

var on_ground = false

var is_attacking = false

var is_dead = false

var fireball_power = 1

func _physics_process(delta):
	
	if is_dead == false:
		if Input.is_action_pressed("d"):
			if is_attacking == false || is_on_floor() == false:
				velocity.x = SPEED
				if is_attacking == false:
					$AnimatedSprite.play("run")
					$AnimatedSprite.flip_h = false
					if sign($Position2D.position.x) == -1:
						$Position2D.position.x *= -1
		elif Input.is_action_pressed("a"):
			if is_attacking == false || is_on_floor() == false:
				velocity.x = -SPEED
				if is_attacking == false:
					$AnimatedSprite.play("run")
					$AnimatedSprite.flip_h = true
					if sign($Position2D.position.x) == 1:
						$Position2D.position.x *= -1
		else:
			velocity.x = 0
			if on_ground == true && is_attacking == false:
				$AnimatedSprite.play("idle")
	
		if Input.is_action_pressed("w"):
			if is_attacking == false:
				if on_ground == true:
					velocity.y = JUMP_POWER
					$jump.play()
					on_ground = false
					
		if Input.is_action_pressed("s"):
			if is_attacking == false:
				velocity.y = -JUMP_POWER

		if Input.is_action_just_pressed("j") && is_attacking == false:
			if is_on_floor():
				velocity.x = 0
			is_attacking = true
			$AnimatedSprite.play("attack")
			var fireball = null
			if fireball_power == 1:
				fireball = FIREBALL.instance()
				$ba.play()
			if fireball_power == 3:
				fireball = FIREBALLRED.instance()
				$tembakapi.play()
			elif  fireball_power == 1000:
				fireball = FIREBIGUP.instance()
				$tembakapi.play()
				
			if sign($Position2D.position.x) == 1:
				fireball.set_fireball_direction(1)
			else:
				fireball.set_fireball_direction(-1)
			get_parent().add_child(fireball)
			fireball.position = $Position2D.global_position
		
		velocity.y += GRAVITY
	
		if Input.is_action_pressed("m"):
			get_tree().change_scene("res://TitleScreen.tscn")
			get_node("/root/main").score = 0
			
			
			

		if is_on_floor():
			if on_ground == false:
				is_attacking = false
			on_ground = true
		else:
			if is_attacking == false:
				on_ground = false
				if velocity.y < 0:
					$AnimatedSprite.play("jump")
				else:
					$AnimatedSprite.play("fall")
		
		
		velocity = move_and_slide(velocity, FLOOR)
		
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Hotdog" in get_slide_collision(i).collider.name:
					dead()
				if "Fries" in get_slide_collision(i).collider.name:
					dead()
				if "burger" in get_slide_collision(i).collider.name:
					dead()
				if "pizza" in get_slide_collision(i).collider.name:
					dead()
				if "softdrink" in get_slide_collision(i).collider.name:
					dead()



func dead():
	is_dead = true
	get_node("/root/main").score -= 200
	velocity = Vector2(0,0)
	$AnimatedSprite.play("dead")
	$matilol.play()
	$CollisionShape2D.call_deferred("set_disabled", true)
	$Timer.start()

func _on_AnimatedSprite_animation_finished():
	is_attacking = false

func _on_Timer_timeout():
	get_tree().reload_current_scene()

func chilli_power_up():
	fireball_power = 3
	
func chilli_big_up():
	fireball_power = 1000



