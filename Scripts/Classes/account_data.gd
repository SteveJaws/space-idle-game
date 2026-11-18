class_name AccountData extends RefCounted

var currency_amount: float = 99999999999999;

var cometLevel: int = 1;
var alienCount: int = 0;

var cometCurrentPrice: int = 100;
var cometBasePrice: int = 100;

var alienCurrentPrice: int = 500;
var alienBasePrice: int = 100;

var stardustPerComet: int = 50;
var stardustPerAlienMine: int = 5;

func _init() -> void:
	pass

func increase_currency(amount: float) -> void:
	self.currency_amount += snappedf(amount, 0.01);
		
func upgrade_comet_level(ignorePriceOfUpgrade: bool = false) -> bool:
	if(self.currency_amount < self.cometCurrentPrice && ignorePriceOfUpgrade == false): return false;
	self.currency_amount = self.currency_amount - self.cometCurrentPrice;
	self.cometLevel += 1;
	self.cometCurrentPrice *= 1.15;
	return true;

func buy_alien() -> bool:
	return true;
