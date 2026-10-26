extends Control

@export var currencyContainer: HBoxContainer;


func update_currency_value(value: float) -> void:
	currencyContainer.value = value;
	currencyContainer.valueElement.text = str(value);
