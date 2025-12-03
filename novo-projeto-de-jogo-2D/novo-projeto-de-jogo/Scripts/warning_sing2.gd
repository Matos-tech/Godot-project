extends Node2D
@onready var texture: Sprite2D = $texture
@onready var area_2d: Area2D = $Area2D

#mensagem
const lines : Array[String]= [
" Essa foi a história de Penpen ",
" em sua jornada",
" para encontrar sua família e amigos ",
" Enquanto enfrenta os problemas",
" causados pel pelas mudanças climáticas ",
" e pela poluição do meio ambiente ",
"--- OBRIGADO POR JOGAR ---",
]

func _unhandled_input(event):
	if area_2d.get_overlapping_bodies().size() > 0:
		texture.show()
		if event.is_action_pressed("interact") && !DialogManager.is_message_active:
			texture.hide()
			DialogManager.start_message(global_position, lines)
			print("tocou")
			
	else:
		texture.hide()
		if DialogManager.dialog_box != null:
			DialogManager.dialog_box.queue_free()
			DialogManager.is_message_active = false
