class_name Deck extends Node


var cards: Array[CardData]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cards.append(TempCard.new())
	cards.append(TempCard2.new())
	cards.append(TempCard3.new())
	cards.shuffle()


func draw_card() -> CardData:
	if cards.size() == 0:
		return
	else:
		var card: CardData = cards[0]
		cards.remove_at(0)
		return card
