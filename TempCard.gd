class_name TempCard extends CardData


func _init() -> void:
	super._init("Temp Card", "On play, +1 to every card in the row", 2, null)


func on_play(board: Array[Array], position: Vector2i) -> void:
	super.on_play(board, position)
	for i in range(board[position.y].size()):
		if i == position.x:
			continue
		var card: CardData = board[position.y][i]
		if card != null:
			card.change_points(1)
