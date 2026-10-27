extends Node

@onready var alienBody: CharacterBody2D = $"..";
@onready var jumpTimer: Timer = $"../DelayTillNextJump";

var planetCore: Marker2D = null;

var gravityStrength: int = 0;

var onPlanet: bool = false;

@export var jumpHeigth: int = 100;
@export var moveSpeed: int = 50;

@export var minTimeTillNewJump: float = 10;
@export var maxTimeTillNewJump: float = 30;

func _ready() -> void:
	self.jumpTimer.wait_time = randf_range(self.minTimeTillNewJump, self.maxTimeTillNewJump);
	self.jumpTimer.start();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(!self.onPlanet): self.gravityStrength += 1;
	if(!self.planetCore): self.find_planet_core(); 
	if(!self.planetCore): return;
	
	var directionToCore: Vector2 = (self.planetCore.global_position - self.alienBody.global_position).normalized();
	
	var gravityVelocity = directionToCore * self.gravityStrength;
	
	var moveVelocity: Vector2 = self.get_move_direction();
	
	self.alienBody.velocity = gravityVelocity + moveVelocity;
	
	self.alienBody.move_and_slide();

func find_planet_core() -> void:
	var possbilePlanetCore = get_tree().root.find_child("PlanetCore", true, false);
	
	if(possbilePlanetCore):
		self.planetCore = possbilePlanetCore;

func _on_area_2d_body_entered(body: Node2D) -> void:
	self.onPlanet = true;
	self.gravityStrength = 0;

func _on_area_2d_body_exited(body: Node2D) -> void:
	self.onPlanet = false;

func jump() -> void:
	self.gravityStrength = self.jumpHeigth * -1;

func get_move_direction() -> Vector2:
	if not self.planetCore:
		return Vector2.ZERO
		
	var to_core = (self.planetCore.global_position - self.alienBody.global_position).normalized()
	
	var surface_tangent = to_core.rotated(PI / 2)
	
	var input_axis = Input.get_axis("ui_left", "ui_right")
	
	return surface_tangent * input_axis * 100;


func _on_delay_till_next_jump_timeout() -> void:
	self.jump()
	self.jumpTimer.wait_time = randf_range(self.minTimeTillNewJump, self.maxTimeTillNewJump);
	self.jumpTimer.start();
