extends Node2D

onready var anim_player = $World/AnimationPlayer

var is_night: bool = false

var current_day_hour = GameTime.get_current_hour()

func _ready():
	pass

func _physics_process(delta):
	var current_day_hour = GameTime.get_current_hour()
	
	if current_day_hour >= GameTime.state_night_start_hour + .1 or current_day_hour < GameTime.state_dawn_start_hour:
			$World/World_lights.visible = true
			$World/Light2D.visible = true
			$World/Light2D2.visible = true
			$World/Light2D3.visible = true
			$World/Light2D4.visible = true
			$World/Light2D5.visible = true
			$World/Light2D6.visible = true
	else:
			$World/World_lights.visible = false
			$World/Light2D.visible = false
			$World/Light2D2.visible = false
			$World/Light2D3.visible = false
			$World/Light2D4.visible = false
			$World/Light2D5.visible = false
			$World/Light2D6.visible = false
	if current_day_hour == 19:
		anim_player.play("Light-Fade")
	elif current_day_hour == 5:
		anim_player.play_backwards("Light-Fade")
