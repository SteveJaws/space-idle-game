extends Node

@onready var stardustPriceLabel: Label = $"../Main/MainColumn/MiddleRow/VBoxContainer/StardustUpgradePrice";
@onready var cometStardustPriceLabel: Label = $"../Main/MainColumn/MiddleRow/VBoxContainer2/CometStardustUpgradePrice";

@onready var accountData: AccountData = ClassAutoload.accountData;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.updateUI();

func _on_upgrade_comet_stardust_button_pressed() -> void:
	var canUpdate: bool = self.accountData.upgrade_comet_stardust_per_time();
	if(canUpdate): self.updateUI();

func _on_upgrade_stardust_button_pressed() -> void:
	var canUpdate: bool = self.accountData.upgrade_stardust_per_time();
	if(canUpdate): self.updateUI();

func updateUI() -> void:
	self.stardustPriceLabel.text = str(snappedf(self.accountData.stardustUpgradePrice, 0.01));
	self.cometStardustPriceLabel.text = str(snappedf(self.accountData.cometStardustUpgradePrice, 0.01));
