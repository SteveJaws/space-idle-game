extends Node

@onready var alienBody: CharacterBody2D = $"..";

var planetCore: Marker2D = null;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(!self.planetCore): self.find_planet_core(); 
	if(!self.planetCore): return;
	
	var moveDirection: Vector2 = (self.planetCore.global_position - self.alienBody.global_position).normalized();
	
	self.alienBody.velocity = moveDirection * 50;
	
	self.alienBody.move_and_slide();

func find_planet_core() -> void:
	var possbilePlanetCore = get_tree().root.find_child("PlanetCore", true, false);
	
	if(possbilePlanetCore):
		self.planetCore = possbilePlanetCore;
