class_name HandCard extends Control


signal selected(value: bool)
var data: CardData:
	set(value):
		data = value
		%Name.text = data.name
		%Description.text = data.description
		%Points.text = str(data.base_points)


func set_selected(value: bool) -> void:
	selected.emit(value)
	%Highlight.visible = value


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_LEFT:
			set_selected(true)
