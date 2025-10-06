extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

const GRAVITY: float = 1000.0

var speed: float = 150.0
var direction: int = 1

var left_limit: float = 728.0
var right_limit: float = 1072.0

func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	
	velocity.x = speed * direction

	sprite.flip_h = direction < 0

	sprite.play("run")

	if global_position.x <= left_limit:
		direction = 1
	elif global_position.x >= right_limit:
		direction = -1
	
	move_and_slide()
