@tool
extends MenuButton

class_name  ButtonDisplayTest

var WINDOW_SIZE : Array[Vector2i]

func _ready() -> void:
	text = "Window Display (test)"
	flat = false

	var popup : PopupMenu = get_popup()
	popup.clear()
	popup.add_item("480 × 320 (HVGA) 3:2",       0)
	popup.add_item("640 × 480 (VGA) 4:3",        1)
	popup.add_item("768 × 480 (WVGA) 16:10",     2)
	popup.add_item("800 × 600 (SVGA) 4:3",       3)
	popup.add_item("960 × 640 (DVGA) 3:2",       4)
	popup.add_item("1280 × 720 (HD) 16:9",       5)
	popup.add_item("1920 × 1080 (FHD) 16:9",     6)
	popup.add_item("512 × 512 (CUSTOM) 1:1",     7)
	popup.add_item("320 × 480 (HVGA) 2:3",       8)
	popup.add_item("480 × 640 (VGA) 3:4",        9)
	popup.add_item("480 × 768 (WVGA) 10:16",    10)
	popup.add_item("600 × 800 (SVGA) 3:4",      11)
	popup.add_item("640 × 960 (DVGA) 2:3",      12)
	popup.add_item("720 × 1280 (HD) 9:16",      13)
	popup.add_item("1080 × 1920 (FHD) 9:16",    14)
	popup.add_item("256x224 (NES NTSC) 8:7",   15)
	popup.add_item("256x240 (NES PAL)  16:15", 16)

	WINDOW_SIZE.clear()
	WINDOW_SIZE.append(Vector2i( 480,  320)) # id  0
	WINDOW_SIZE.append(Vector2i( 640,  480)) # id  1
	WINDOW_SIZE.append(Vector2i( 768,  480)) # id  2
	WINDOW_SIZE.append(Vector2i( 800,  600)) # id  3
	WINDOW_SIZE.append(Vector2i( 960,  640)) # id  4
	WINDOW_SIZE.append(Vector2i(1280,  720)) # id  5
	WINDOW_SIZE.append(Vector2i(1920, 1080)) # id  6
	WINDOW_SIZE.append(Vector2i( 512,  512)) # id  7
	WINDOW_SIZE.append(Vector2i( 320,  480)) # id  8
	WINDOW_SIZE.append(Vector2i( 480,  640)) # id  9
	WINDOW_SIZE.append(Vector2i( 480,  768)) # id 10
	WINDOW_SIZE.append(Vector2i( 600,  800)) # id 11
	WINDOW_SIZE.append(Vector2i( 640,  960)) # id 12
	WINDOW_SIZE.append(Vector2i( 720, 1280)) # id 13
	WINDOW_SIZE.append(Vector2i(1080, 1920)) # id 14
	WINDOW_SIZE.append(Vector2i( 256,  224)) # id 15
	WINDOW_SIZE.append(Vector2i( 256,  240)) # id 16

	popup.connect("id_pressed", _on_button_pressed)

func _on_button_pressed(id : int ) -> void:
	if id < WINDOW_SIZE.size():
		DisplayServer.window_set_size(WINDOW_SIZE[id])

		# fix godot v4 window resize
		# get_viewport().set_size(DisplayServer.window_get_size())
		get_viewport().set_size(WINDOW_SIZE[id])
