extends Node2D

@onready var sprite: Sprite2D = $StaticBody2D/Sprite2D;
@onready var playerData: PlayerData = ClassAutoload.playerData;

var inGameUiController;

var canScale: bool = true;

@onready var scaleFrom: Vector2 = self.sprite.scale;
@onready var scaleTo: Vector2 = self.sprite.scale * 0.97;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.inGameUiController = get_tree().root.find_child("InGameUiController", true, false);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		var mousePos: Vector2 = get_global_mouse_position();
		
		var localPost: Vector2 = self.sprite.to_local(mousePos);
		
		if(self.sprite.get_rect().has_point(localPost)):
			playerData.increase_currency(playerData.stardustPerClick)
			self.inGameUiController.update_currency_value(playerData.currency_amount);
			if(self.canScale): self.scale_self();

func scale_self() -> void:
	self.canScale = false;
	var tween = get_tree().create_tween();
	tween.tween_property(self.sprite, "scale", self.scaleTo, 0.1)
	tween.tween_property(self.sprite, "scale", self.scaleFrom, 0.1)
	self.canScale = true;
