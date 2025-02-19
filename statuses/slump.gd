class_name SlumpStatus
extends Status

const ACCURACY_PENALTY := 0.1

func get_tooltip() -> String:
	return "In a Slump: -%d%% accuracy for %d turns" % [ACCURACY_PENALTY * 100, duration]

func initialize_status(target: Node) -> void:
	status_changed.connect(_on_status_changed.bind(target))
	_on_status_changed(target)

func _on_status_changed(target: Node) -> void:
	assert(target.get("modifier_handler"), "No modifiers on %s" % target)
	
	var accuracy_modifier: Modifier = target.modifier_handler.get_modifier(Modifier.Type.ACCURACY)
	assert(accuracy_modifier, "No accuracy modifier on %s" % target)
	
	var slump_value := accuracy_modifier.get_value("slump")
	
	if not slump_value:
		slump_value = ModifierValue.create_new_modifier("slump", ModifierValue.Type.PERCENT_BASED)
		slump_value.percent_value = -ACCURACY_PENALTY
		accuracy_modifier.add_new_value(slump_value)
