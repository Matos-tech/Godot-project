extends CharacterBody2D

const SPEED = 150.0
const JUMP_FORCE = -350.0

@export var player_life := 3

var knockback_vector := Vector2.ZERO
var is_jumping := false

@onready var animation := $AnimatedSprite2D
@onready var remote_transform := $Remote

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_FORCE
		is_jumping = true

	if is_on_floor() and velocity.y == 0:
		is_jumping = false

	var direction := Input.get_axis("ui_left", "ui_right")

	if direction != 0:
		velocity.x = direction * SPEED
		animation.scale.x = -direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if is_jumping:
		animation.play("jump")
	elif direction != 0:
		animation.play("run")
	else:
		animation.play("idle")

	if knockback_vector != Vector2.ZERO:
		velocity = knockback_vector

	move_and_slide()

func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		take_damage(Vector2(200, -200))
		if player_life <= 0:
			queue_free()
			get_tree().reload_current_scene()

func take_damage(knockback_force := Vector2.ZERO, duration := 0.25):
	player_life -= 1
	if knockback_force != Vector2.ZERO:
		knockback_vector = knockback_force
		var t := get_tree().create_tween()
		t.tween_property(self, "knockback_vector", Vector2.ZERO, duration)

func follow_camera(camera):
	remote_transform.remote_path = camera.get_path()
	
#func take_damage(knockback_force :=Vector2.ZERO, duration :=0.25):
	#player_life -=1
	
	#if knockback_force != Vector2.ZERO:
		#knockback_vector = knockback_force
		
		#var knockback_tween := get_tree().create_tween()
		#knockback_tween.tween_property(self,"knockback_vactor", Vector2.ZERO, duration)
