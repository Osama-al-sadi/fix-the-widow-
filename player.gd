extends KinematicBody2D

var velocity = Vector2(0,0)
var window_near = null
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 900

func _physics_process(delta):
	if Input.is_action_just_pressed("fix") and window_near:
		window_near.fix_window()
	if Input.is_action_pressed("fix"):
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()

	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# القفز
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().create_timer(0.1)
		velocity.y = -250
	
	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite.flip_h=false
		velocity.x = -150
		
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite.flip_h=true
		velocity.x = 150
	else:
		
		velocity.x = lerp(velocity.x, 0, 0.1)

	velocity = move_and_slide(velocity)
