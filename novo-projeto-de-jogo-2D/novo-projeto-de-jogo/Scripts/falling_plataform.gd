extends AnimatableBody2D

@onready var anin := $anin as AnimationPlayer
@onready var respawn_timer := $respawn_timer as Timer
@onready var respawn_position := global_position

@export var reset_timer := 1.0
var velocity := Vector2.ZERO 
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var is_triggered:= false 

func _ready():
	set_physics_process(false)

func _physics_process(delta):
	velocity.y += gravity * delta
	position += velocity * delta


func has_collided_whith(collision: KinematicCollision2D, collider: CharacterBody2D):
	if !is_triggered:
		is_triggered = true
		anin.play("shake")
		velocity = Vector2.ZERO


func _on_anin_animation_finished(anim_name: StringName) -> void:
	set_physics_process(true) 
	respawn_timer.start(reset_timer)


func _on_respawn_timer_timeout() -> void:
	set_physics_process(false)
	global_position = respawn_position
	velocity = Vector2.ZERO
	is_triggered = false
