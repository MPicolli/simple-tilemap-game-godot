extends CharacterBody2D

const GRAVITY = 300.0

var speed = 300.0

var jump_force = -450.0

var direction_x
var direction_y

func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	
	direction_x = Input.get_axis("ui_left", "ui_right")
	velocity.x = speed * direction_x
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_force
	
	move_and_slide()
