class_name Game extends Node


var board: Array[Array]
var hand: Hand
var deck: Deck


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	board = []
	for i in range(5):
		var row: Array[CardData] = []
		for j in range(5):
			row.append(null)
		board.append(row)
	deck = Deck.new()
	add_child(deck)
	hand = %Hand
	for panel in %GridContainer.get_children():
		panel.gui_input.connect(
			func(event: InputEvent) -> void:
				if event is InputEventMouseButton and event.is_pressed():
					if hand.selected_card != null:
						play_card(hand.selected_card, panel)
		)
	


func draw_card() -> void:
	var card: CardData = deck.draw_card()
	card.draw_cards.connect(
		func(amount: int) -> void:
			for i in range(amount):
				draw_card()
	)
	card.discard_card.connect(
		func(index: int) -> void:
			hand.remove_card(index)
	)
	hand.add_card(card)
	#var hand_card: HandCard = preload("res://hand_card.tscn").instantiate()
	#hand_card.data = card
	#%HandCards.add_child(hand_card)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	draw_card()


func play_card(card: HandCard, panel: Control) -> void:
	var grid_card: GridCard = preload("res://grid_card.tscn").instantiate()
	grid_card.data = card.data
	grid_card.position = card.position
	add_child(grid_card)
	hand.remove_card(card.get_index())
	card.queue_free()
	var tween := create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUAD)
	tween.tween_property(grid_card, "position", panel.global_position, 0.2)
	tween.tween_callback(
		func() -> void:
			remove_child(grid_card)
			panel.add_child(grid_card)
			grid_card.data.on_play(board, index_to_position(panel.get_index()))
	)


func index_to_position(index: int) -> Vector2i:
	return Vector2i(index / 5, index % 5)
