tool
extends Node2D

class_name BorderlessDisplay

var viewport  : Viewport
var base_size : Vector2

# @export_subgroup("Project Settings")
var viewport_width  : int
var viewport_height : int

# @export_subgroup("Borderless Guides")
var guides_draw : bool

var show_guides_landscape : bool = 1
var show_guides_portrait  : bool = 1

var guides_offset : Vector2
var guides_line   : float = 3

var color_ratio_1_1  : Color = Color.yellow
var color_ratio_3_2  : Color = Color.blue
var color_ratio_4_3  : Color = Color.red
var color_ratio_16_9 : Color = Color.green

# Agrupar exports en godot v3 para dejarlo funcionando
# similar que en godot v4
# func _get(property : String) -> Variant:
func _get(property : String):
	if property == "project_settings/viewport_width":
		return _get_viewport_width()
	if property == "project_settings/viewport_height":
		return _get_viewport_height()
	if property == "project_settings/window_width_override":
		return _get_window_width_override()
	if property == "project_settings/window_height_override":
		return _get_window_height_override()
	if property == "project_settings/rendering_gpu_pixel_snap":
		return _get_rendering_gpu_pixel_snap()
	if property == "borderless_guides/guides_draw":
		return guides_draw
	if property == "borderless_guides/show_guides_landscape":
		return show_guides_landscape
	if property == "borderless_guides/show_guides_portrait":
		return show_guides_portrait
	if property == "borderless_guides/guides_offset":
		return guides_offset
	if property == "borderless_guides/guides_line":
		return guides_line
	if property == "borderless_guides/color_ratio_1_1":
		return color_ratio_1_1
	if property == "borderless_guides/color_ratio_3_2":
		return color_ratio_3_2
	if property == "borderless_guides/color_ratio_4_3":
		return color_ratio_4_3
	if property == "borderless_guides/color_ratio_16_9":
		return color_ratio_16_9

# func _set(property : String, val : Variant) -> bool
func _set(property : String, val) -> bool:
	if property == "project_settings/viewport_width":
		_set_viewport_width(val)
		return true
	if property == "project_settings/viewport_height":
		_set_viewport_height(val)
		return true
	if property == "project_settings/window_width_override":
		_set_window_width_override(val)
		return true
	if property == "project_settings/window_height_override":
		_set_window_height_override(val)
		return true
	if property == "project_settings/rendering_gpu_pixel_snap":
		_set_rendering_gpu_pixel_snap(val)
		return true
	if property == "borderless_guides/guides_draw":
		_set_guides_draw(val)
		return true
	if property == "borderless_guides/show_guides_landscape":
		_set_show_guides_landscape(val)
		return true
	if property == "borderless_guides/show_guides_portrait":
		_set_show_guides_portrait(val)
		return true
	if property == "borderless_guides/guides_offset":
		_set_guides_offset(val)
		return true
	if property == "borderless_guides/guides_line":
		_set_guides_line(val)
		return true
	if property == "borderless_guides/color_ratio_1_1":
		_set_color_ratio_1_1(val)
		return true
	if property == "borderless_guides/color_ratio_3_2":
		_set_color_ratio_3_2(val)
		return true
	if property == "borderless_guides/color_ratio_4_3":
		_set_color_ratio_4_3(val)
		return true
	if property == "borderless_guides/color_ratio_16_9":
		_set_color_ratio_16_9(val)
		return true

	# fix set property default
	return ._set(property, val)

func _get_property_list() -> Array:
	var properties = []
	
	properties.append({
		"name": "project_settings/viewport_width",
		"type": TYPE_INT
	})
	properties.append({
		"name": "project_settings/viewport_height",
		"type": TYPE_INT
	})
	properties.append({
		"name": "project_settings/window_width_override",
		"type": TYPE_INT
	})
	properties.append({
		"name": "project_settings/window_height_override",
		"type": TYPE_INT
	})
	properties.append({
		"name": "project_settings/rendering_gpu_pixel_snap",
		"type": TYPE_BOOL
	})
	properties.append({
		"name": "borderless_guides/guides_draw",
		"type": TYPE_BOOL
	})
	properties.append({
		"name": "borderless_guides/show_guides_landscape",
		"type": TYPE_BOOL
	})
	properties.append({
		"name": "borderless_guides/show_guides_portrait",
		"type": TYPE_BOOL
	})
	properties.append({
		"name": "borderless_guides/guides_offset",
		"type": TYPE_VECTOR2
	})
	properties.append({
		"name": "borderless_guides/guides_line",
		"type": TYPE_INT
	})
	properties.append({
		"name": "borderless_guides/color_ratio_1_1",
		"type": TYPE_COLOR
	})
	properties.append({
		"name": "borderless_guides/color_ratio_3_2",
		"type": TYPE_COLOR
	})
	properties.append({
		"name": "borderless_guides/color_ratio_4_3",
		"type": TYPE_COLOR
	})
	properties.append({
		"name": "borderless_guides/color_ratio_16_9",
		"type": TYPE_COLOR
	})
	
	return properties

func _set_rendering_gpu_pixel_snap(val : bool) -> void:
	ProjectSettings.set_setting(
		"rendering/2d/snapping/use_gpu_pixel_snap", val)
	update()

func _get_rendering_gpu_pixel_snap() -> bool:
	return ProjectSettings.get_setting(
		"rendering/2d/snapping/use_gpu_pixel_snap");

func _set_show_guides_landscape(val : bool) -> void:
	show_guides_landscape = val
	update()

func _set_show_guides_portrait(val : bool) -> void:
	show_guides_portrait = val
	update()

func _set_viewport_width(val : int) -> void:
	viewport_width = val
	ProjectSettings.set_setting("display/window/size/width", val)
	update()

func _set_viewport_height(val : int) -> void:
	viewport_height = val
	ProjectSettings.set_setting("display/window/size/height", val)
	update()

func _set_window_width_override(val : int) -> void:
	ProjectSettings.set_setting(
		"display/window/size/test_width", val)

func _set_window_height_override(val : int) -> void:
	ProjectSettings.set_setting(
		"display/window/size/test_height", val)

func _get_viewport_width() -> int:
	return ProjectSettings.get_setting("display/window/size/width")

func _get_viewport_height() -> int:
	return ProjectSettings.get_setting("display/window/size/height")

func _get_window_width_override() -> int:
	return ProjectSettings.get_setting("display/window/size/test_width")

func _get_window_height_override() -> int:
	return ProjectSettings.get_setting("display/window/size/test_height")

func _set_guides_line(l : float) -> void:
	guides_line = l
	update()

func _set_color_ratio_1_1(c : Color) -> void:
	color_ratio_1_1 = c
	update()

func _set_color_ratio_3_2(c : Color) -> void:
	color_ratio_3_2 = c
	update()

func _set_color_ratio_4_3(c : Color) -> void:
	color_ratio_4_3 = c
	update()

func _set_color_ratio_16_9(c : Color) -> void:
	color_ratio_16_9 = c
	update()

func _set_guides_offset(val : Vector2) -> void:
	guides_offset = val
	update()

func _set_guides_draw(set_draw : bool) -> void:
	guides_draw = set_draw
	update()

func _draw() -> void:
	if not self.guides_draw:
		return

	base_size = Vector2(self.viewport_width, self.viewport_height)

	var ratio_1_1  : Vector2 = Vector2( 1,  1)
	var ratio_3_2  : Vector2 = Vector2( 3,  2)
	var ratio_4_3  : Vector2 = Vector2( 4,  3)
	var ratio_16_9 : Vector2 = Vector2(16,  9)

	var ratio_2_3  : Vector2 = Vector2( 2,  3)
	var ratio_3_4  : Vector2 = Vector2( 3,  4)
	var ratio_9_16 : Vector2 = Vector2( 9, 16)

	var scale_ratio_1_1 : float = min(
		ratio_16_9.x/ratio_1_1.x, ratio_16_9.y/ratio_1_1.y)

	var scale_ratio_3_2 : float = min(
		ratio_16_9.x/ratio_3_2.x, ratio_16_9.y/ratio_3_2.y)

	var scale_ratio_4_3 : float = min(
		ratio_16_9.x/ratio_4_3.x, ratio_16_9.y/ratio_4_3.y)

	var scale_ratio_2_3 : float = min(
		ratio_9_16.x/ratio_2_3.x, ratio_9_16.y/ratio_2_3.y)

	var scale_ratio_3_4 : float = min(
		ratio_9_16.x/ratio_3_4.x, ratio_9_16.y/ratio_3_4.y)

	var scale_guide : float = min(
		base_size.x/scale_ratio_1_1, base_size.y/scale_ratio_1_1)

	var size_ratio_16_9 : Vector2 = ratio_16_9 * scale_guide
	var size_ratio_3_2  : Vector2 = ratio_3_2  * scale_ratio_3_2  * scale_guide
	var size_ratio_4_3  : Vector2 = ratio_4_3  * scale_ratio_4_3  * scale_guide
	var size_ratio_1_1  : Vector2 = ratio_1_1  * scale_ratio_1_1  * scale_guide


	var size_ratio_2_3  : Vector2 = ratio_2_3  * scale_ratio_2_3  * scale_guide
	var size_ratio_3_4  : Vector2 = ratio_3_4  * scale_ratio_3_4  * scale_guide
	var size_ratio_9_16 : Vector2 = ratio_9_16 * scale_guide

	var auto_center : Vector2 = (base_size/2) - (size_ratio_1_1/2)
	var position_offset : Vector2 = (size_ratio_1_1/2) + \
										guides_offset + auto_center



	if show_guides_landscape:
		draw_rect(
			Rect2(-(size_ratio_16_9)/2 + position_offset, size_ratio_16_9),
											color_ratio_16_9, false, guides_line)
		draw_rect(
			Rect2(-(size_ratio_3_2)/2 + position_offset, size_ratio_3_2),
											color_ratio_3_2, false, guides_line)
		draw_rect(
			Rect2(-(size_ratio_4_3)/2 + position_offset, size_ratio_4_3),
											color_ratio_4_3, false, guides_line)

	if show_guides_portrait:
		draw_rect(
			Rect2(-(size_ratio_9_16)/2 + position_offset, size_ratio_9_16),
											color_ratio_16_9, false, guides_line)
		draw_rect(
			Rect2(-(size_ratio_2_3)/2 + position_offset, size_ratio_2_3),
											color_ratio_3_2, false, guides_line)
		draw_rect(
			Rect2(-(size_ratio_3_4)/2 + position_offset, size_ratio_3_4),
											color_ratio_4_3, false, guides_line)

	draw_rect(
		Rect2(-(size_ratio_1_1)/2 + position_offset, size_ratio_1_1),
										color_ratio_1_1, false, guides_line)

	# Dibujar tamaño de pantalla
	draw_rect(Rect2(Vector2.ZERO, base_size), Color.pink, false, 1)

func _ready() -> void:
	viewport = get_viewport()
	base_size = Vector2(self.viewport_width, self.viewport_height)

	_on_window_resize()
	assert(not viewport.connect(
		"size_changed", self, "_on_window_resize"))

func _on_window_resize() -> void:
	if Engine.is_editor_hint():
		return

	var display_size : Vector2 = viewport.get_visible_rect().size

	var ratio : float = min(
		(display_size/base_size).x, (display_size/base_size).y)

	# no funciona si se utiliza self
	position = (display_size/2) - ( (base_size/2) * ratio )
	scale = Vector2(ratio, ratio)
