# Seguir instrucciones para agregar soporte a godot v3
@tool  # <- Comentar   @tool para godot v3

# tool # <- Descomentar tool para godot v3
extends EditorPlugin

const ADDON_NODE_PATH : String = \
				"res://addons/borderless_display/nodes/godot_v{major}/{class}.gd"

var _godot_version : int
var _button_resolution : MenuButton

func _enter_tree() -> void:

	var icon_borderless : Texture
	var icon_button : Texture

	self._godot_version = Engine.get_version_info().major

	# REF: https://github.com/godotengine/godot/tree/4.0/editor/icons
	if self._godot_version > 3:
		icon_borderless = get_editor_interface().\
												get_base_control().\
														theme.get_icon(
										"SubViewportContainer","EditorIcons")

		icon_button = get_editor_interface().\
												get_base_control().\
														theme.get_icon(
										"MenuButton","EditorIcons")

	# REF: https://github.com/godotengine/godot/tree/3.x/editor/icons
	else:
		icon_borderless = get_editor_interface().\
												get_base_control().\
													call("get_icon",
													"ViewportContainer", "EditorIcons")
		icon_button = get_editor_interface().\
										get_base_control().\
											call("get_icon",
											"MenuButton", "EditorIcons")

	add_custom_type(
		"BorderlessDisplay", "Node2D",
		load(ADDON_NODE_PATH.format({
			"major": _godot_version,
			"class": "BorderlessDisplay"})), icon_borderless)

	add_custom_type(
		"ButtonDisplayTest", "MenuButton",
		load(ADDON_NODE_PATH.format({
			"major": _godot_version,
			"class": "ButtonDisplayTest"})), icon_button)

	_button_resolution = load(ADDON_NODE_PATH.format({
		"major": _godot_version,
		"class": "ButtonDisplayTest"})).new()

	add_control_to_container(
			CONTAINER_CANVAS_EDITOR_MENU, _button_resolution)

func _exit_tree() -> void:
	remove_control_from_container(
			CONTAINER_CANVAS_EDITOR_MENU, _button_resolution)

	remove_custom_type("BorderlessDisplay")
	remove_custom_type("ButtonDisplayTest")
