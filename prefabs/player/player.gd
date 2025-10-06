extends CharacterBody2D

const GRAVITY: float = 1000.0

var speed: float = 300.0
var jump_force: float = -400.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var camera: Camera2D = $Camera2D

var direction_x: float = 0.0
var direction_y: float = 0.0

func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	
	direction_x = Input.get_axis("ui_left", "ui_right")
	velocity.x = speed * direction_x
	
	if direction_x and is_on_floor():
		sprite.play("run")
	else:
		sprite.play("idle")
	
	if direction_x > 0:
		sprite.flip_h = false
	elif direction_x < 0:
		sprite.flip_h = true
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_force
	
	move_and_slide()
