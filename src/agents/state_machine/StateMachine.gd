extends Node
class_name StateMachine, "res://assets/engine/state_machine.svg"

"""
Generic State Machine. Intializes states and delegates engine callbacks
(_physics_process, _unhandle_input) to the active state.
"""
