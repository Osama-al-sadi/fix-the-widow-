extends KinematicBody2D

var velocity = Vector2(0,0)

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 900

func _physics_process(delta):

	# الجاذبية
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# القفز
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# الحركة يمين ويسار
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = lerp(velocity.x, 0, 0.1)

	velocity = move_and_slide(velocity)
	
