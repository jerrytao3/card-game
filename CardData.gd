class_name CardData extends Resource


signal draw_cards(amount: int)
signal discard_card(index: int)


@export var name: String
@export_multiline var description: String
@export var base_points: int
@export var icon: Texture2D


func _init(name: String, description: String, base_points: int, icon: Texture2D) -> void:
	self.name = name
	self.description = description
	self.base_points = base_points
	self.icon = icon


func on_play(board: Array[Array], position: Vector2i) -> void:
	pass


func on_retain(board: Array[Array], hand: Hand) -> void:
	pass


func change_points(amount: int) -> void:
	pass
