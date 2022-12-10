extends CanvasLayer

const NIGHT_COLOR = Color("#3006004b")
const DAY_COLOR = Color("#00000000")

onready var overlay = $ColorRect
var time = 0

#func _process(delta):
	#time += delta
	#overlay.color = NIGHT_COLOR.linear_interpolate(DAY_COLOR, sin(time +1) / 2)
