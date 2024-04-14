class_name RuneInputHandle extends Node2D

signal on_apprentice_talked(words: String)

var current_str: String = ""

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and not event.is_pressed() and not event.is_echo():
		var typed_event = event as InputEventKey
		var key = _keycode_to_str(typed_event.keycode)
		print(key)
		if typed_event.keycode == KEY_ENTER or \
			typed_event.keycode == KEY_KP_ENTER:
				if current_str.length() != 0:
					on_apprentice_talked.emit(current_str)
					current_str = ""
		else:
			current_str = current_str + key
		
func _keycode_to_str(k: Key) -> String: 
	match k:
		KEY_A:
			return "a"
		KEY_B:
			return "b"
		KEY_C:
			return "c"
		KEY_D:
			return "d"
		KEY_E:
			return "e"
		KEY_F:
			return "f"
		KEY_G:
			return "g"
		KEY_H:
			return "h"
		KEY_I:
			return "i"
		KEY_J:
			return "j"
		KEY_K:
			return "k"
		KEY_L:
			return "l"
		KEY_M:
			return "m"
		KEY_N:
			return "n"
		KEY_O:
			return "o"
		KEY_P:
			return "p"
		KEY_Q:
			return "q"
		KEY_R:
			return "r"
		KEY_S:
			return "s"
		KEY_T:
			return "t"
		KEY_U:
			return "u"
		KEY_V:
			return "v"
		KEY_W:
			return "w"
		KEY_X:
			return "x"
		KEY_Y:
			return "y"
		KEY_Z:
			return "z"
			
	return " "
		
