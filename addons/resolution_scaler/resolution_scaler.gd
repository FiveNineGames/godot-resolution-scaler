## A utility node that will poll the frame rate of the game every second
## and change the resolution scale accordingly to attempt to keep the game
## running at the desired frame rate.
class_name ResolutionScaler
extends Node


@export var enabled: bool = false

## The number of frames to ignore on startup before scaling the resolution.
## [br][br]
## [b]Note[/b]: This will reduce the likelihood of unnecessarily reducing the
## scale to very low values during initialisation.
@export var frames_to_ignore: int = 120

## The maximum scale value to be applied once the target frame rate is reached.
@export var maximum_scale: float = 1.0

## The FPS that the scaling aims to achieve and maintain.
@export_range(20, 200, 1.0) var target_fps: int = 60

var _ignored_frames: int = 0
var _timer: Timer


func _ready() -> void:
	_timer = Timer.new()
	_timer.wait_time = 1.0
	_timer.timeout.connect(_on_timer_timeout)
	add_child(_timer)


func _process(delta: float) -> void:
	if _ignored_frames < frames_to_ignore:
		_ignored_frames += 1
		return

	if enabled and _timer.is_stopped():
		_timer.start()
	elif not enabled and not _timer.is_stopped():
		_timer.stop()


func _on_timer_timeout() -> void:
	var fps := Engine.get_frames_per_second()
	var viewport := get_viewport()
	var adjustment_multiplier: float = fps / target_fps

	viewport.scaling_3d_scale = minf(
		viewport.scaling_3d_scale * adjustment_multiplier,
		maximum_scale
	)
