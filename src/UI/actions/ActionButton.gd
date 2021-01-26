extends Button


export var action: String


func _on_pressed() -> void:
	Actions.emit_signal("action", action)
