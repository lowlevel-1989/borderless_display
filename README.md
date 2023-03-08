# Borderless Display 1.0.0

1. Install directly from Godot Asset Library

or

1. Download this respository, move `lowlevel-1989/borderless_display` to your `{project_dir}`

2. Enable it from Project -> Settings -> Plugin

## Getting Started

### BorderlessDisplay

- BorderlessDisplay, New node to control the scaling area of our game.

### ButtonDisplayTest

- ButtonDisplayTest, New node for testing with multiple resolutions.

### support Godot v3

file plugin.gd
```gdscript
# Seguir instrucciones para agregar soporte a godot v3
@tool  # <- Comentar   @tool para godot v3

# tool # <- Descomentar tool para godot v3

extends EditorPlugin

func _enter_tree() -> void:
    pass


func _exit_tree() -> void:
	pass
```
leave it this way
```gdscript
# Seguir instrucciones para agregar soporte a godot v3
# @tool  # <- Comentar   @tool para godot v3

tool # <- Descomentar tool para godot v3

extends EditorPlugin

func _enter_tree() -> void:
    pass


func _exit_tree() -> void:
	pass
```
