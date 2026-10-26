extends Node2D

var targetDirection: Vector2;
var cometSpeed: float;

@export var minCometSpeed: float = 100;
@export var maxCometSpeed: float = 200;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.cometSpeed = randf_range(minCometSpeed, maxCometSpeed);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += targetDirection * self.cometSpeed * delta;


func _on_life_time_timeout() -> void:
	self.queue_free();
