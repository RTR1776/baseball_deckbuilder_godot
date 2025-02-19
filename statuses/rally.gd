class_name RallyStatus
extends Status

const POWER_BOOST := 0.25

func get_tooltip() -> String:
	return "Rally Time: +%d%% power for %d turns" % [POWER_BOOST * 100, duration]

func initialize_status(target: Node) -> void:
	status_changed.connect(_on_status_changed.bind(target))
	_on_status_changed(target)

func _on_status_changed(target: Node) -> void:
	assert(target.get("modifier_handler"), "No modifiers on %s" % target)
	
	var dmg_dealt_modifier: Modifier = target.modifier_handler.get_modifier(Modifier.Type.DMG_DEALT)
	assert(dmg_dealt_modifier, "No damage dealt modifier on %s" % target)
	
	var rally_value := dmg_dealt_modifier.get_value("rally")
	
	if not rally_value:
		rally_value = ModifierValue.create_new_modifier("rally", ModifierValue.Type.PERCENT_BASED)
		rally_value.percent_value = POWER_BOOST
		dmg_dealt_modifier.add_new_value(rally_value)
	
	if duration <= 0:
		dmg_dealt_modifier.remove_value("rally")
