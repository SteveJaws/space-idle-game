extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func load():
	var file = FileAccess.open("res://Assets/SaveData/save.json", FileAccess.READ);
	if(file == null): return;
	var json_text = file.get_as_text();
	if(json_text.length() < 1): return;
	
	var saveData = JSON.parse_string(json_text);
	var levels = saveData["levels"];
	
	var starDustLevel = levels["stardust"]["level"];
	var cometStarDustLevel = levels["comet"]["level"]
	
	for i in range(starDustLevel): ClassAutoload.playerData.upgrade_stardust_per_time();
	for i in range(cometStarDustLevel): ClassAutoload.playerData.upgrade_comet_stardust_per_time();
