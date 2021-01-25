extends Node
class_name State, "res://assets/engine/state.svg"

"""
State Interface to use in Hierarchical State Machines.
"""

onready var _state_machine := _get_state_machine(self)


func unhandled_input(event: InputEvent) -> void:
	pass


func physics_process(delta: float) -> void:
	pass


func enter(msg: Dictionary = {}) -> void:
	pass


func exit() -> void:
	pass


func _get_state_machine(node: Node) -> Node:
	if node != null and not node.is_in_group("state_machine"):
		return _get_state_machine(node.get_parent())
	
	return node
