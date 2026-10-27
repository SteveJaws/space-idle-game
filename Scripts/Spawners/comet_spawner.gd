extends Node

@onready var cometContainer: Node2D = $"..";
@onready var timer: Timer = $CometSpawnTimer;

@export var cometTargetArea: CollisionShape2D;
@export var cometSpawnAreaTop: CollisionShape2D;
@export var cometSpawnAreaRight: CollisionShape2D;
@export var cometSpawnAreaBottom: CollisionShape2D;
@export var cometSpawnAreaLeft: CollisionShape2D;

@onready var cometSpawnAreaList: Array[CollisionShape2D] = [self.cometSpawnAreaTop, self.cometSpawnAreaRight, self.cometSpawnAreaBottom, self.cometSpawnAreaLeft];

func get_rand_f() -> float:
	return randf_range(0, 100);

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.cometContainer.visible = true;
	self.set_timer(self.get_rand_f());

func set_timer(delay: float) -> void:
	timer.wait_time = delay;
	timer.start();

func _on_comet_spawn_timer_timeout() -> void:
	var scene = preload("res://Scenes/comet.tscn").instantiate();
	
	self.spawn_comet(scene, self.cometSpawnAreaList.get(randi_range(0, self.cometSpawnAreaList.size() - 1)));

func spawn_comet(comet: Node2D, cometSpawnArea: CollisionShape2D) -> void:
	var cometSpawnAreaX: float = cometSpawnArea.global_position.x;
	var cometSpawnAreaY: float = cometSpawnArea.global_position.y;
	var cometSpawnAreaWidth: float = cometSpawnArea.shape.get_rect().size.x;
	var cometSpawnAreaHeight: float = cometSpawnArea.shape.get_rect().size.y;
	
	var spawnX = randf_range(cometSpawnAreaX - (cometSpawnAreaWidth / 2), cometSpawnAreaX + (cometSpawnAreaWidth / 2));
	var spawnY = randf_range(cometSpawnAreaY - (cometSpawnAreaHeight / 2), cometSpawnAreaY + (cometSpawnAreaHeight / 2));
	
	var cometSpawnPos: Vector2 = Vector2(spawnX, spawnY)
	
	var cometTargetAreaX: float = self.cometTargetArea.global_position.x;
	var cometTargetAreaY: float = self.cometTargetArea.global_position.y;
	var cometTargetAreaWidth: float = self.cometTargetArea.shape.get_rect().size.x;
	var cometTargetAreaHeight: float = self.cometTargetArea.shape.get_rect().size.y;
	
	var targetX = randf_range(cometTargetAreaX, cometTargetAreaX + cometTargetAreaWidth)
	var targetY = randf_range(cometTargetAreaY, cometTargetAreaY + cometTargetAreaHeight)
	
	var cometTargetPos: Vector2 = Vector2(targetX, targetY);
	
	comet.global_position = cometSpawnPos;
	comet.targetDirection = (cometTargetPos - comet.global_position).normalized();
	
	self.cometContainer.add_child(comet);
	
	set_timer(self.get_rand_f());
