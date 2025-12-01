extends CharacterBody2D


const SPEED = 1500.0

var direction:= -1
@onready var animation:= $AnimaIni as AnimatedSprite2D
@onready var wall_detector := $wall_detector as RayCast2D

func _physics_process(delta: float) -> void:
	# Gavidade
	if not is_on_floor():
		velocity += get_gravity() * delta
	#muda direcao se colidir 
	if wall_detector.is_colliding():
		direction *= -1
		animation.scale.x =-direction
	velocity.x = direction *SPEED * delta
	
	animation.play("idle")
	move_and_slide()
