class_name PlayerData extends RefCounted

var currency_amount: float = 0;

var stardustPerTimeLevel: int = 1;
var cometStardustPerTimeLevel: int = 1;

var stardustPerTime: float = 1.0;
var cometStardustPerTime: float = 10.0;

var upgradeData: UpgradeData = UpgradeData.new();

func _init() -> void:
	pass

func increase_currency(amount: float) -> void:
	currency_amount += snappedf(amount, 0.01);

func upgrade_stardust_per_time() -> void:
	if(self.stardustPerTimeLevel > 1): self.stardustPerTime *= upgradeData.stardustPerTimeMultiplier;
	self.stardustPerTimeLevel += 1;
		
func upgrade_comet_stardust_per_time() -> void:
	if(self.cometStardustPerTimeLevel > 1): self.cometStardustPerTime += upgradeData.cometStardustAmountMultiplier;
	self.cometStardustPerTimeLevel += 1;
