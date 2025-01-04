class_name TempCard3 extends CardData


func _init() -> void:
	super._init("Temp Card 3", "On retain, +1 point to current points", 0, null)


func on_retain(board: Array[Array], hand: Hand) -> void:
	super.on_retain(board, hand)
	change_points(1)
