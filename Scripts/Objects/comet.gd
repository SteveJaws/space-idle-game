extends Node2D

var targetDirection: Vector2;
var cometSpeed: float;

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D;

@onready var playerData: PlayerData = ClassAutoload.playerData;
@onready var inGameUiController: Control = null;

@export var minCometSpeed: float = 100;
@export var maxCometSpeed: float = 200;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.cometSpeed = randf_range(minCometSpeed, maxCometSpeed);
	self.inGameUiController = get_tree().root.find_child("InGameUiController", true, false);
	self.draw_sprite_correctly();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += targetDirection * self.cometSpeed * delta;

func _on_life_time_timeout() -> void:
	self.queue_free();

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		if(check_if_click_is_inside_comet(get_global_mouse_position())):
			playerData.increase_currency(self.playerData.cometStardustPerClick);
			self.inGameUiController.update_currency_value(playerData.currency_amount);
			self.queue_free();

func check_if_click_is_inside_comet(click_position: Vector2) -> bool:
	var local_pos = sprite.to_local(click_position)
	
	return sprite.get_rect().has_point(local_pos)

func draw_sprite_correctly() -> void:
	pass
	if(self.targetDirection.x < self.sprite.global_position.x):
		self.sprite.flip_h = true;
	if(self.targetDirection.y < self.sprite.global_position.y):
		self.sprite.flip_v = true;
