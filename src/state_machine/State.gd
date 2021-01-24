extends Node
class_name State, "res://assets/engine/state.svg"

"""
State Interface to use in Hierarchical State Machines.
"""


func unhandled_input(event: InputEvent) -> void:
	pass


func physics_process(delta: float) -> void:
	pass


func enter(msg: Dictionary = {}) -> void:
	pass


func exit() -> void:
	pass


func _get_state_machine(node: Node) -> Node:
	if node != null && not node.is_class("StateMachine"):
		return _get_state_machine(node.get_parent())
	
	return node
