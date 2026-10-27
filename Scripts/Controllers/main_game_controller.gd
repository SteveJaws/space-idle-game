extends Node

@onready var timer: Timer = $CurrencyTimer;

@onready var playerData: PlayerData = ClassAutoload.playerData;

@onready var inGameUiController: Control = $"../InGameUiController";
@onready var saveLoader: Node = $SaveLoader;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var file = FileAccess.open("res://Assets/SaveData/save.json", FileAccess.READ);
	if(file == null): return;
	var json_text = file.get_as_text();
	if(json_text.length() < 1): return;
	saveLoader.load(json_text);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	self.automatic_currency()

func automatic_currency() -> void:
	self.playerData.increase_currency(playerData.stardustPerTime);
	self.inGameUiController.update_currency_value(playerData.currency_amount);
