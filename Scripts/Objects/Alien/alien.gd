extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AlienAnimation;

@export var alienColor: Color = Color.WHITE;

func _ready() -> void:
	sprite.modulate = alienColor;
