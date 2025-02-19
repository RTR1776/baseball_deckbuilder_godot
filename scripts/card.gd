@export var momentum_cost: int = 1

func can_play() -> bool:
    return Battle.current_momentum >= momentum_cost

func play():
    if can_play():
        Battle.use_momentum(momentum_cost)
