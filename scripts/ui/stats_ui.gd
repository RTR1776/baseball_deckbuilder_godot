extends Control

@onready var momentum_label = $MomentumLabel
@onready var runs_label = $RunsLabel

func _ready():
    Events.momentum_changed.connect(_on_momentum_changed)
    Events.runs_changed.connect(_on_runs_changed)

func _on_momentum_changed(current: int, maximum: int):
    momentum_label.text = "Momentum: %d/%d" % [current, maximum]

func _on_runs_changed(current: int, maximum: int):
    runs_label.text = "Runs: %d/%d" % [current, maximum]
