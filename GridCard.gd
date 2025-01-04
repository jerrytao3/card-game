class_name GridCard extends PanelContainer


var data: CardData:
	set(value):
		data = value
		%Points.text = str(data.base_points)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
