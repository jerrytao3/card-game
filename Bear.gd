class_name Bear extends CardData


func on_play(board: Array[Array], position: Vector2i) -> void:
	super.on_play(board, position)
	discard_card.emit(0)
