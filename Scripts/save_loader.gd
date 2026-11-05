extends Node

func load():
	var file = FileAccess.open("res://Assets/SaveData/save.json", FileAccess.READ);
	if(file == null): return;
	var json_text = file.get_as_text();
	if(json_text.length() < 1): return;
	
	var saveData = JSON.parse_string(json_text);
	var levels = saveData["levels"];
	
	var starDustLevel = levels["stardust"]["level"];
	var cometStarDustLevel = levels["comet"]["level"]
	
	var ignorePriceOfUpgrade: bool = true
	var skipStartInitialLevel: int = 0;
	
	for i in range(starDustLevel):
		if(i == skipStartInitialLevel): continue;
		ClassAutoload.accountData.upgrade_stardust_per_time(ignorePriceOfUpgrade);
	for i in range(cometStarDustLevel):
		if(i == skipStartInitialLevel): continue;
		ClassAutoload.accountData.upgrade_comet_stardust_per_time(ignorePriceOfUpgrade);
