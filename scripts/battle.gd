var current_momentum: int = 3
var max_momentum: int = 3
var runs: int = 20
var max_runs: int = 20

func _ready():
    Events.emit_signal("momentum_changed", current_momentum, max_momentum)
    Events.emit_signal("runs_changed", runs, max_runs)

func end_turn():
    current_momentum = max_momentum
    Events.emit_signal("momentum_changed", current_momentum, max_momentum)

func use_momentum(amount: int) -> bool:
    if current_momentum >= amount:
        current_momentum -= amount
        Events.emit_signal("momentum_changed", current_momentum, max_momentum)
        return true
    return false

func modify_runs(amount: int):
    runs = clamp(runs + amount, 0, max_runs)
    Events.emit_signal("runs_changed", runs, max_runs)
