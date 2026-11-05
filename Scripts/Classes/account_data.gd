class_name AccountData extends RefCounted

var currency_amount: float = 0;

var stardustPerClickLevel: int = 1;
var cometStardustPerClickLevel: int = 1;

var stardustPerClick: float = 1.0;
var cometStardustPerClick: float = 50.0;

var stardustUpgradePrice: float = 100.0;
var cometStardustUpgradePrice: float = 200.0;
var alienPrice: float = 500.0;

var upgradeData: UpgradeData = UpgradeData.new();

func _init() -> void:
	pass

func increase_currency(amount: float) -> void:
	self.currency_amount += snappedf(amount, 0.01);

func upgrade_stardust_per_time(ignorePriceOfUpgrade: bool = false) -> bool:
	if(self.currency_amount < self.stardustUpgradePrice && ignorePriceOfUpgrade == false): return false;
	self.currency_amount = snappedf(self.currency_amount - self.stardustUpgradePrice, 0.01)
	self.stardustPerClick *= upgradeData.stardustPerClickMultiplier;
	self.stardustPerClickLevel += 1;
	self.stardustUpgradePrice *= upgradeData.stardustCostPriceMultiplier;
	return true;
		
func upgrade_comet_stardust_per_time(ignorePriceOfUpgrade: bool = false) -> bool:
	if(self.currency_amount < self.cometStardustUpgradePrice && ignorePriceOfUpgrade == false): return false;
	self.currency_amount = snappedf(self.currency_amount - self.cometStardustUpgradePrice, 0.01)
	self.cometStardustPerClick += upgradeData.cometStardustAmountMultiplier;
	self.cometStardustPerClickLevel += 1;
	self.cometStardustUpgradePrice *= self.upgradeData.cometStardustPriceMultiplier
	return true;
