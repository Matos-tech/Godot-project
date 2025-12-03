extends Node2D
@onready var texture: Sprite2D = $texture
@onready var area_2d: Area2D = $Area2D

#mensagem
const lines : Array[String]= [
" Olá, Penpen… que saudades! ",
" Você precisa nos encontrar. ",
" Tivemos de fugir… ",
" Nosso lar começou a derreter ",
" e as temperaturas subiram muito. ",
" Quase não restou gelo ",
"Por isso tivemos que migrar",
"Venha logo Ass.: Sra. Penpen",

]

func _unhandled_input(event):
	if area_2d.get_overlapping_bodies().size() > 0:
		texture.show()
		if event.is_action_pressed("interact") && !DialogManager.is_message_active:
			texture.hide()
			DialogManager.start_message(global_position,lines)
			print("tocou")
			
	else:
		texture.hide()
		if DialogManager.dialog_box != null:
			DialogManager.dialog_box.queue_free()
			DialogManager.is_message_active = false
