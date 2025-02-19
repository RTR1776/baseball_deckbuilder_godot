class_name FatigueStatus
extends Status

const POWER_REDUCTION := 0.15

func get_tooltip() -> String:
	return "Fatigued: -%d%% power for %d stacks" % [POWER_REDUCTION * 100, stacks]

func initialize_status(target: Node) -> void:
	status_changed.connect(_on_status_changed.bind(target))
	_on_status_changed(target)

func _on_status_changed(target: Node) -> void:
	assert(target.get("modifier_handler"), "No modifiers on %s" % target)
	
	var dmg_dealt_modifier: Modifier = target.modifier_handler.get_modifier(Modifier.Type.DMG_DEALT)
	assert(dmg_dealt_modifier, "No damage dealt modifier on %s" % target)
	
	var fatigue_value := dmg_dealt_modifier.get_value("fatigue")
	
	if not fatigue_value:
		fatigue_value = ModifierValue.create_new_modifier("fatigue", ModifierValue.Type.PERCENT_BASED)
		
	fatigue_value.percent_value = -POWER_REDUCTION * stacks
	dmg_dealt_modifier.add_new_value(fatigue_value)
