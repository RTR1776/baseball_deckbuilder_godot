extends Control

@onready var label = $Label

func _ready():
    Events.runs_changed.connect(_on_runs_changed)

func _on_runs_changed(current: int, maximum: int):
    label.text = "Runs: %d/%d" % [current, maximum]
