class_name PlayerData extends RefCounted

var currency_amount: float = 0;

var stardustPerClickLevel: int = 1;
var cometStardustPerClickLevel: int = 1;

var stardustPerClick: float = 1.0;
var cometStardustPerClick: float = 10.0;

var upgradeData: UpgradeData = UpgradeData.new();

func _init() -> void:
	pass

func increase_currency(amount: float) -> void:
	currency_amount += snappedf(amount, 0.01);

func upgrade_stardust_per_time() -> void:
	if(self.stardustPerClickLevel > 1): self.stardustPerClick *= upgradeData.stardustPerClickMultiplier;
	self.stardustPerClickLevel += 1;
		
func upgrade_comet_stardust_per_time() -> void:
	if(self.cometStardustPerClickLevel > 1): self.cometStardustPerClick += upgradeData.cometStardustAmountMultiplier;
	self.cometStardustPerClickLevel += 1;
