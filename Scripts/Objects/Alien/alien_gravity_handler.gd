extends Node

@onready var alienBody: CharacterBody2D = $"..";
@onready var jumpTimer: Timer = $"../DelayTillNextJump";
@onready var delayMoveTimer: Timer = $"../DelayTillNextMove";
@onready var moveTimeTimer: Timer = $"../MoveTime";
@onready var animationNode: AnimatedSprite2D = $"../AlienAnimation";
@onready var alienMineAnimationNode: AnimatedSprite2D = $"../AlienMineAnimation";

var planetCore: Marker2D = null;

var gravityStrength: int = 0;

var onPlanet: bool = false;
var canMove: bool = false;

var moveDirection: int = -1;

@export var jumpHeigth: int = 100;
@export var moveSpeed: int = 50;

@export var minTimeTillNewJump: float = 10;
@export var maxTimeTillNewJump: float = 30;
@export var minTimeTillNewMovement: float = 5;
@export var maxTimeTillNewMovement: float = 45;
@export var minTimeMovementLength: float = 3;
@export var maxTimeMovementLength: float = 10;

func _ready() -> void:
	self.jumpTimer.wait_time = randf_range(self.minTimeTillNewJump, self.maxTimeTillNewJump);
	self.jumpTimer.start();
	
	self.delayMoveTimer.wait_time = randf_range(self.minTimeTillNewMovement, self.maxTimeTillNewMovement);
	self.delayMoveTimer.start();
	self.alienMineAnimationNode.animation = "default";

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(!self.onPlanet): self.gravityStrength += 1;
	if(!self.planetCore): self.find_planet_core(); 
	if(!self.planetCore): return;
	
	var directionToCore: Vector2 = (self.planetCore.global_position - self.alienBody.global_position).normalized();
	
	var gravityVelocity = directionToCore * self.gravityStrength;
	
	var moveVelocity: Vector2 = Vector2.ZERO;
	
	if(self.canMove): moveVelocity = self.get_move_direction();
	
	self.alienBody.velocity = gravityVelocity + moveVelocity;
	
	self.alienBody.move_and_slide();
	self.animation_handling();

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
	
	return surface_tangent * self.moveSpeed * self.moveDirection;

func _on_delay_till_next_jump_timeout() -> void:
	if(self.onPlanet):
		self.jump()
	self.jumpTimer.wait_time = randf_range(self.minTimeTillNewJump, self.maxTimeTillNewJump);
	self.jumpTimer.start();

func _on_delay_till_next_move_timeout() -> void:
	var moveDirection: int = 0;
	
	while(moveDirection == 0):
		moveDirection = randi_range(-1, 1);
	
	self.moveDirection = moveDirection;
	
	if(self.onPlanet):
		self.canMove = true;
	self.moveTimeTimer.wait_time = randf_range(self.minTimeMovementLength, self.maxTimeMovementLength);
	self.moveTimeTimer.start();

func _on_move_time_timeout() -> void:
	self.canMove = false;
	self.delayMoveTimer.wait_time = randf_range(self.minTimeTillNewMovement, self.maxTimeTillNewMovement);
	self.delayMoveTimer.start();

func animation_handling() -> void:
	if(!self.onPlanet): 
		self.animationNode.animation = "Jump";
		self.alienMineAnimationNode.pause();
		self.alienMineAnimationNode.frame = 0;
	elif(self.canMove): 
		self.animationNode.animation = "Walk"
		self.alienMineAnimationNode.pause();
		self.alienMineAnimationNode.frame = 0;
	else: 
		self.animationNode.animation = "Idle";
		self.alienMineAnimationNode.play();
	
	if(moveDirection == -1): self.animationNode.flip_h = false;
	else: self.animationNode.flip_h = true;
