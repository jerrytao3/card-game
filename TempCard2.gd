class_name TempCard2 extends CardData


func _init() -> void:
	super._init("Temp Card 2", "On play, draw 2 cards", 3, null)


func on_play(board: Array[Array], position: Vector2i) -> void:
	super.on_play(board, position)
	draw_cards.emit(2)
	
	
