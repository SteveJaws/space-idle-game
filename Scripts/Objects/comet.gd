extends Node2D

var targetDirection: Vector2;
var targetLocation: Vector2;
var cometSpeed: float;
var mouseEntered: bool = false;

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D;

@onready var accountData: AccountData = ClassAutoload.accountData;
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
		if(self.mouseEntered):
			accountData.increase_currency(self.accountData.cometStardustPerClick);
			self.queue_free();

func draw_sprite_correctly() -> void:
	self.sprite.look_at(self.targetLocation)
	self.sprite.rotate((PI / 2) * -1)


func _on_area_2d_mouse_entered() -> void:
	self.mouseEntered = true;

func _on_area_2d_mouse_exited() -> void:
	self.mouseEntered = false;
