extends Node

@onready var timer: Timer = $CurrencyTimer;

@onready var playerData: PlayerData = ClassAutoload.playerData;

@onready var inGameUiController: Control = $"../InGameUiController";

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(playerData.currency_amount);


func _on_timer_timeout() -> void:
	self.automatic_currency()

func automatic_currency() -> void:
	var automatic_addup_value = 1;
	
	playerData.increase_currency(automatic_addup_value);
	inGameUiController.update_currency_value(playerData.currency_amount);
