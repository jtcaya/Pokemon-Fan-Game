extends ColorRect

## The color of the night state.
export (Color) var color_night = Color("#6406004b")
## The color of the dawn state.
export (Color) var color_dawn = Color("#2adbb3b3")
## The color of the day state.
export (Color) var color_day = Color("#00000000")
## The color of the dusk state.
export (Color) var color_dusk = Color("#64ff3300")
## The amount of in-game seconds of delay.
export (int) var delay = 0

onready var color_transition_tween = $"/root/SceneManager/TimeOfDay/ColorTransitionTween"


func _ready():
	# Connect signals.
	var current_cycle_changed_signal = GameTime.connect(
		"current_cycle_changed", self, "_on_current_cycle_changed"
	)

	# Check if signals are connected correctly.
	if current_cycle_changed_signal != OK:
		printerr(current_cycle_changed_signal)

	# Sync the delay with in-game time.
	if delay < 0:
		delay = 0
		push_warning("The 'delay' (%s) in the '%s' node must be >= 0." % [delay, self.name])
	elif delay > 0:
		delay /= float(GameTime.IN_GAME_SECONDS_PER_REAL_TIME_SECONDS)

	# Set the current cycle state.
	match GameTime.current_cycle:
		GameTime.CycleState.NIGHT:
			color = color_night
		GameTime.CycleState.DAWN:
			color = color_dawn
		GameTime.CycleState.DAY:
			color = color_day
		GameTime.CycleState.DUSK:
			color = color_dusk


# CALLBACKS
# ---------
func _on_current_cycle_changed():
	match GameTime.current_cycle:
		GameTime.CycleState.NIGHT:
			if not GameTime.changing_time_manually:
				if delay > 0:
					yield(get_tree().create_timer(delay), "timeout")

				color_transition_tween.interpolate_property(
					self,
					"color",
					color_dusk,
					color_night,
					GameTime.state_transition_duration,
					Tween.TRANS_SINE,
					Tween.EASE_OUT
				)
				color_transition_tween.start()
			else:
				color_transition_tween.stop_all()
				color = color_night
		GameTime.CycleState.DAWN:
			if not GameTime.changing_time_manually:
				if delay > 0:
					yield(get_tree().create_timer(delay), "timeout")

				color_transition_tween.interpolate_property(
					self,
					"color",
					color_night,
					color_dawn,
					GameTime.state_transition_duration,
					Tween.TRANS_SINE,
					Tween.EASE_OUT
				)
				color_transition_tween.start()
			else:
				color_transition_tween.stop_all()
				color = color_dawn
		GameTime.CycleState.DAY:
			if not GameTime.changing_time_manually:
				if delay > 0:
					yield(get_tree().create_timer(delay), "timeout")

				color_transition_tween.interpolate_property(
					self,
					"color",
					color_dawn,
					color_day,
					GameTime.state_transition_duration,
					Tween.TRANS_SINE,
					Tween.EASE_OUT
				)
				color_transition_tween.start()
			else:
				color_transition_tween.stop_all()
				color = color_day
		GameTime.CycleState.DUSK:
			if not GameTime.changing_time_manually:
				if delay > 0:
					yield(get_tree().create_timer(delay), "timeout")

				color_transition_tween.interpolate_property(
					self,
					"color",
					color_day,
					color_dusk,
					GameTime.state_transition_duration,
					Tween.TRANS_SINE,
					Tween.EASE_OUT
				)
				color_transition_tween.start()
			else:
				color_transition_tween.stop_all()
				color = color_dusk
