class_name Hand extends Control


var cards: Array[HandCard]
var selected_card: HandCard
var separation: int = 10
var y_position: int = 1500


func _process(delta: float) -> void:
	if cards.size() == 0:
		return
	var initial_position: float = get_tree().root.size.x / 2 - cards.size() / 2 * (cards[0].size.x + separation) - cards[0].size.x / 2
	if cards.size() % 2 == 0:
		initial_position += (cards[0].size.x + separation) / 2
	for i in range(cards.size()):
		cards[i].position.x = lerpf(cards[i].position.x, initial_position + i * (cards[0].size.x + separation), 0.1)
		cards[i].position.y = lerpf(cards[i].position.y, y_position, 0.1)


func add_card(card: CardData) -> void:
	if cards.size() >= 5:
		return
	var hand_card: HandCard = preload("res://hand_card.tscn").instantiate()
	hand_card.data = card
	hand_card.selected.connect(
		func(value: bool) -> void:
			if value:
				if selected_card != null and selected_card != hand_card:
					selected_card.set_selected(false)
				selected_card = hand_card
	)
	cards.append(hand_card)
	add_child(hand_card)


func remove_card(index: int) -> HandCard:
	var card: HandCard = cards[index]
	if card == selected_card:
		selected_card = null
	cards.remove_at(index)
	return card


#func remove_selected_card() -> void:
