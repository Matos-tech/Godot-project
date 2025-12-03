extends Node2D
@onready var texture: Sprite2D = $texture
@onready var area_2d: Area2D = $Area2D

#mensagem
const lines : Array[String]= [
" Cuidado Penpen, ",
" No decorrer do caminho ",
" O gelo vai ficando ",
" Cada vez mais fino e instavel ",
" -Seja rapido e cuidadoso- ",


]

func _unhandled_input(event):
	if area_2d.get_overlapping_bodies().size() > 0:
		texture.show()
		if event.is_action_pressed("interact") && !DialogManager.is_message_active:
			texture.hide()
			DialogManager.start_message(global_position,lines)
			
	else:
		texture.hide()
		if DialogManager.dialog_box != null:
			DialogManager.dialog_box.queue_free()
			DialogManager.is_message_active = false
