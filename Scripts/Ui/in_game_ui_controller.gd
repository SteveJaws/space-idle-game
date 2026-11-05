extends Control

@export var currencyContainer: HBoxContainer;

func update_currency_value(value: float) -> void:
	currencyContainer.value = value;
	currencyContainer.valueElement.text = str(value);

func _physics_process(delta: float) -> void:
	var value: float = ClassAutoload.accountData.currency_amount;
	currencyContainer.value = value;
	currencyContainer.valueElement.text = str(value);
