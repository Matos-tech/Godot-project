extends MarginContainer

@onready var text_label: Label = $MarginContainer/text_label
@onready var letter_timer_display: Timer = $letter_timer_display

const MAX_WIDTH = 256

var text=""
var letter_index=0

var letter_display_timer :=0.07
var space_display_timer :=0.05
var punctuaction_display_timer :=0.02
# terminar de exibir
signal text_display_finished()
