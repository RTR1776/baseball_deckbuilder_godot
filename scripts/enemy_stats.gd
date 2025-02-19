# ...existing code...
@export var max_outs: int = 3
var current_outs: int

func _ready():
    current_outs = max_outs
    # ...existing code...

func take_out():
    current_outs -= 1
    Events.emit_signal("enemy_outs_changed", current_outs, max_outs)
# ...existing code...
