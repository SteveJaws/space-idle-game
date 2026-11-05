class_name AccountData extends RefCounted

var currency_amount: float = 1000;

var stardustPerClickLevel: int = 1;
var cometStardustPerClickLevel: int = 1;

var stardustPerClick: int = 1;
var cometStardustPerClick: int = 50;
var alienPerClick: int = 10;

var stardustUpgradePrice: int = 100;
var cometStardustUpgradePrice: int = 200;
var alienPrice: int = 500;

var upgradeData: UpgradeData = UpgradeData.new();

func _init() -> void:
	pass

func increase_currency(amount: float) -> void:
	self.currency_amount += snappedf(amount, 0.01);

func upgrade_stardust_per_time(ignorePriceOfUpgrade: bool = false) -> bool:
	if(self.currency_amount < self.stardustUpgradePrice && ignorePriceOfUpgrade == false): return false;
	self.currency_amount = self.currency_amount - self.stardustUpgradePrice;
	self.stardustPerClick *= upgradeData.stardustPerClickMultiplier;
	self.stardustPerClickLevel += 1;
	self.stardustUpgradePrice *= upgradeData.stardustCostPriceMultiplier;
	self.upgradeData.stardustCostPriceMultiplier *= 1.5;
	return true;
		
func upgrade_comet_stardust_per_time(ignorePriceOfUpgrade: bool = false) -> bool:
	if(self.currency_amount < self.cometStardustUpgradePrice && ignorePriceOfUpgrade == false): return false;
	self.currency_amount = self.currency_amount - self.cometStardustUpgradePrice
	self.cometStardustPerClick += upgradeData.cometStardustAmountMultiplier;
	self.cometStardustPerClickLevel += 1;
	self.cometStardustUpgradePrice *= self.upgradeData.cometStardustPriceMultiplier;
	self.upgradeData.cometStardustPriceMultiplier *= 1.5;
	return true;
