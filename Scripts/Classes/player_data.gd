class_name PlayerData extends RefCounted

var currency_amount: float = 0;

func _init() -> void:
	pass

func increase_currency(amount: float) -> void:
	currency_amount += amount;
