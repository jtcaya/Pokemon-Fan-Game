extends Node2D

onready var light_overlay = $World/World_lights
onready var light_1 = $World/Light2D
onready var light_2 = $World/Light2D2
onready var light_3 = $World/Light2D3
onready var light_4 = $World/Light2D4
onready var light_5 = $World/Light2D5
onready var light_6 = $World/Light2D6
var time = 0

func _ready():
	light_overlay.visible = false
	light_1.visible = false
	light_2.visible = false
	light_3.visible = false
	light_4.visible = false
	light_5.visible = false
	light_6.visible = false

#func _process(delta):
	#time += delta / 2
	#if time == 1:
		#light_overlay.visible = true
		#light_1.visible = true
		#light_2.visible = true
		#light_3.visible = true
		#light_4.visible = true
		#light_5.visible = true
		#light_6.visible = true
	
