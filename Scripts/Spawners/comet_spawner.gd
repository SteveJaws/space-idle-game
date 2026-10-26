extends Node

@onready var timer: Timer = $CometSpawnTimer;
@export var cometSpawnArea: CollisionShape2D;
@export var cometTargetArea: CollisionShape2D;

func get_rand_f() -> float:
	return randf_range(0, 2);

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.set_timer(self.get_rand_f());

func set_timer(delay: float) -> void:
	timer.wait_time = delay;
	timer.start();

func _on_comet_spawn_timer_timeout() -> void:
	var scene = preload("res://Scenes/comet.tscn").instantiate();
	
	self.spawn_comet(scene);

func spawn_comet(comet: Node2D) -> void:
	var cometSpawnAreaX: float = self.cometSpawnArea.global_position.x;
	var cometSpawnAreaY: float = self.cometSpawnArea.global_position.y;
	var cometSpawnAreaWidth: float = self.cometSpawnArea.shape.get_rect().size.x;
	var cometSpawnAreaHeight: float = self.cometSpawnArea.shape.get_rect().size.y;
	
	var spawnX = randf_range(cometSpawnAreaX, cometSpawnAreaX + cometSpawnAreaWidth);
	var spawnY = randf_range(cometSpawnAreaY, cometSpawnAreaY + cometSpawnAreaHeight);
	
	var cometSpawnPos: Vector2 = Vector2(spawnX, spawnY)
	
	var cometTargetAreaX: float = self.cometTargetArea.global_position.x;
	var cometTargetAreaY: float = self.cometTargetArea.global_position.y;
	var cometTargetAreaWidth: float = self.cometTargetArea.shape.get_rect().size.x;
	var cometTargetAreaHeight: float = self.cometTargetArea.shape.get_rect().size.y;
	
	var targetX = randf_range(cometTargetAreaX, cometTargetAreaX + cometTargetAreaWidth)
	var targetY = randf_range(cometTargetAreaY, cometTargetAreaY + cometTargetAreaHeight)
	
	var cometTargetPos: Vector2 = Vector2(targetX, targetY);
	
	comet.global_position = cometSpawnPos;
	comet.targetPos = cometTargetPos;
	
	get_tree().get_root().add_child(comet);
	
	set_timer(self.get_rand_f());
