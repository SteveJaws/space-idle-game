extends Node

@onready var playerData: PlayerData = ClassAutoload.playerData;

@onready var inGameUiController: Control = $"../InGameUiController";
@onready var saveLoader: Node = $SaveLoader;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	saveLoader.load();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
