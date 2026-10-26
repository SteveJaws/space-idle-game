class_name PlayerData extends RefCounted

var currency_amount: float = 0;

var stardustPerTime: float = 1;
var cometStardustPerTime: float = 10;

var upgradeData: UpgradeData = UpgradeData.new();

func _init() -> void:
	pass

func increase_currency(amount: float) -> void:
	currency_amount += snappedf(amount, 0.01);

func upgrade_stardust_per_time(levelsUp: int) -> void:
	ditwerktnogniet
	stardustPerTime += upgradeData.stardustPerSecondMultiplier  * levelsUp;
		
func upgrade_comet_stardust_per_time(levelsUp: int) -> void:
	ditwerktnogniet
	cometStardustPerTime += upgradeData.cometStardustAmountMultiplier * levelsUp;
