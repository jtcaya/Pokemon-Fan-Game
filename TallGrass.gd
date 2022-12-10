extends Node2D

const GrassStepEffect = preload("res://GrassStepEffect.tscn")

var player_inside: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var player = Utils.get_player()
	player.connect("player_moving_signal", self, "player_exiting_grass")
	player.connect("player_stopped_signal", self, "player_in_grass")
	
func player_exiting_grass():
	player_inside = false
	
func player_in_grass():
	if player_inside == true:
		var grass_step_effect = GrassStepEffect.instance()
		grass_step_effect.position = position
		get_tree().current_scene.add_child(grass_step_effect)

func _on_Area2D_body_entered(body):
	player_inside = true
