@tool
extends Node2D

class_name BorderlessDisplay

var viewport  : Viewport
var base_size : Vector2

@export_subgroup("Project Settings")
@export var viewport_width         : int :
	set = _set_viewport_width,
	get = _get_viewport_width
@export var viewport_height        : int :
	set = _set_viewport_height,
	get = _get_viewport_height
@export var window_width_override  : int :
	set = _set_window_width_override,
	get = _get_window_width_override
@export var window_height_override : int :
	set = _set_window_height_override,
	get = _get_window_height_override

@export_subgroup("Borderless Guides")
@export var guides_draw : bool : set = _set_guides_draw

@export var show_guides_landscape : bool = 1 : set = _set_show_guides_landscape
@export var show_guides_portrait  : bool = 1 : set = _set_show_guides_portrait

@export var guides_offset  : Vector2 : set = _set_guides_offset
@export var guides_line : float = 3 :
	set = _set_guides_line
@export var color_ratio_1_1  : Color = Color.YELLOW :
	set = _set_color_ratio_1_1
@export var color_ratio_3_2  : Color = Color.BLUE :
	set = _set_color_ratio_3_2
@export var color_ratio_4_3  : Color = Color.RED :
	set = _set_color_ratio_4_3
@export var color_ratio_16_9 : Color = Color.GREEN :
	set = _set_color_ratio_16_9

func _set_show_guides_landscape(val : bool) -> void:
	show_guides_landscape = val
	queue_redraw()

func _set_show_guides_portrait(val : bool) -> void:
	show_guides_portrait = val
	queue_redraw()

func _set_viewport_width(val : int) -> void:
	ProjectSettings.set_setting(
		"display/window/size/viewport_width", val)
	queue_redraw()

func _set_viewport_height(val : int) -> void:
	ProjectSettings.set_setting(
		"display/window/size/viewport_height", val)
	queue_redraw()

func _set_window_width_override(val : int) -> void:
	ProjectSettings.set_setting(
		"display/window/size/window_width_override", val)

func _set_window_height_override(val : int) -> void:
	ProjectSettings.set_setting(
		"display/window/size/window_height_override", val)

func _get_viewport_width() -> int:
	return ProjectSettings.get_setting(
		"display/window/size/viewport_width")

func _get_viewport_height() -> int:
	return ProjectSettings.get_setting(
		"display/window/size/viewport_height")

func _get_window_width_override() -> int:
	return ProjectSettings.get_setting(
		"display/window/size/window_width_override")

func _get_window_height_override() -> int:
	return ProjectSettings.get_setting(
		"display/window/size/window_height_override")

func _set_guides_line(l : float) -> void:
	guides_line = l
	queue_redraw()

func _set_color_ratio_1_1(c : Color) -> void:
	color_ratio_1_1 = c
	queue_redraw()

func _set_color_ratio_3_2(c : Color) -> void:
	color_ratio_3_2 = c
	queue_redraw()

func _set_color_ratio_4_3(c : Color) -> void:
	color_ratio_4_3 = c
	queue_redraw()

func _set_color_ratio_16_9(c : Color) -> void:
	color_ratio_16_9 = c
	queue_redraw()

func _set_guides_offset(val : Vector2) -> void:
	guides_offset = val
	queue_redraw()

func _set_guides_draw(set_draw : bool) -> void:
	guides_draw = set_draw
	queue_redraw()

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

	var scale_ratio_1_1 : float = minf(
		ratio_16_9.x/ratio_1_1.x, ratio_16_9.y/ratio_1_1.y)

	var scale_ratio_3_2 : float = minf(
		ratio_16_9.x/ratio_3_2.x, ratio_16_9.y/ratio_3_2.y)

	var scale_ratio_4_3 : float = minf(
		ratio_16_9.x/ratio_4_3.x, ratio_16_9.y/ratio_4_3.y)

	var scale_ratio_2_3 : float = minf(
		ratio_9_16.x/ratio_2_3.x, ratio_9_16.y/ratio_2_3.y)

	var scale_ratio_3_4 : float = minf(
		ratio_9_16.x/ratio_3_4.x, ratio_9_16.y/ratio_3_4.y)

	var scale_guide : float = minf(
		base_size.x/scale_ratio_1_1, base_size.y/scale_ratio_1_1)

	var size_ratio_16_9 : Vector2 = ratio_16_9 * scale_guide
	var size_ratio_3_2  : Vector2 = ratio_3_2  * scale_ratio_3_2  * scale_guide
	var size_ratio_4_3  : Vector2 = ratio_4_3  * scale_ratio_4_3  * scale_guide
	var size_ratio_1_1  : Vector2 = ratio_1_1  * scale_ratio_1_1  * scale_guide


	var size_ratio_2_3  : Vector2 = ratio_2_3  * scale_ratio_2_3  * scale_guide
	var size_ratio_3_4  : Vector2 = ratio_3_4  * scale_ratio_3_4  * scale_guide
	var size_ratio_9_16 : Vector2 = ratio_9_16 * scale_guide


	var position_offset : Vector2 = ( (size_ratio_1_1)/2 ) + guides_offset

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
	draw_rect(Rect2(Vector2.ZERO, base_size), Color.PINK, false, 1)

func _ready() -> void:
	viewport = get_viewport()
	base_size = Vector2(self.viewport_width, self.viewport_height)

	_on_window_resize()
	assert(not viewport.connect("size_changed", _on_window_resize))

func _on_window_resize() -> void:
	if Engine.is_editor_hint():
		return

	var display_size : Vector2 = viewport.get_visible_rect().size

	var ratio : float = minf(
		(display_size/base_size).x, (display_size/base_size).y)

	self.position = (display_size/2) - ( (base_size/2) * ratio )
	self.scale = Vector2(ratio, ratio)
