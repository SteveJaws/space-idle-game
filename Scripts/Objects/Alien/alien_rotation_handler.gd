extends Node

@onready var alienBody: CharacterBody2D = $"..";

var planetCore: Marker2D = null;
var planetTop: Marker2D = null;
var planetBottom: Marker2D = null;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(!self.planetCore): self.find_planet_core();
	
	self.rotation_thing();

func find_planet_core() -> void:
	var possbilePlanetCore = get_tree().root.find_child("PlanetCore", true, false);
	
	if(possbilePlanetCore):
		self.planetCore = possbilePlanetCore;
	
func rotation_thing() -> void:
	alienBody.look_at(self.planetCore.global_position)
	
	alienBody.rotate((PI / 2 )* -1)
