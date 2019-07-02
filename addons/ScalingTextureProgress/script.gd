tool
extends MarginContainer

export(Texture) var background_texture setget set_background_texture, get_background_texture
export(Texture) var foreground_texture setget set_foreground_texture, get_foreground_texture
export(Texture) var progress_texture setget set_progress_texture, get_progress_texture

# TextureProgress attributes
export(int, 'Left to Right', 'Right to Left', 'Top to Bottom', 'Bottom to Top', 'clockwise', 'Counter clockwise') var fill_mode = 0 setget set_fill_mode, get_fill_mode
export(int, 0, 360) var radial_initial_angle = 0 setget set_radial_initial_angle, get_radial_initial_angle
export(int, 1, 360) var fill_degrees = 360 setget set_fill_degrees, get_fill_degrees
export(Vector2) var radial_center_offset = Vector2(0.0, 0.0) setget set_radial_center_offset, get_radial_center_offset

# Range attributes
export(bool) var exp_unit_value = false setget set_exp_unit_value, is_unit_value_exp
export(bool) var rounded_values = true setget set_rounded_values, is_rounded_values
export(float) var maximum = 100.0 setget set_max, get_max
export(float) var minimum = 0.0 setget set_min, get_min
export(float) var page = 0.0 setget set_page, get_page
export(float) var step = 1.0 setget set_step, get_step
export(float) var value = 1.0 setget set_value, get_value

var progress_texture_node = TextureProgress.new()
var node_2d = Node2D.new()

func _ready():
  node_2d.add_child(progress_texture_node)
  add_child(node_2d)

  var custom_minimum_size = get_custom_minimum_size()
  var size = progress_texture_node.get_size()

  var scale_x = custom_minimum_size.x / size.x
  var scale_y = custom_minimum_size.y / size.y
  var scale_value = min(scale_x, scale_y)
  var decal = Vector2(0.0, 0.0)

  if scale_x > scale_value:
    decal.x = ((scale_x - scale_value) / 2.0 * size.x) / scale_value
  elif scale_y > scale_value:
    decal.y = ((scale_y - scale_value) / 2.0 * size.y) / scale_value

  node_2d.set_scale(Vector2(scale_value, scale_value))
  progress_texture_node.set_pos(decal)

# TextureProgress attributes
func set_background_texture(texture):
  progress_texture_node.set_under_texture(texture)

func set_foreground_texture(texture):
  progress_texture_node.set_over_texture(texture)

func set_progress_texture(texture):
  progress_texture_node.set_progress_texture(texture)

func set_fill_mode(value):
  progress_texture_node.set_fill_mode(value)

func set_radial_initial_angle(value):
  progress_texture_node.set_radial_initial_angle(value)

func set_fill_degrees(value):
  progress_texture_node.set_fill_degrees(value)

func set_radial_center_offset(value):
  progress_texture_node.set_radial_center_offset(value)

func get_background_texture():
  return progress_texture_node.get_under_texture()

func get_foreground_texture():
  return progress_texture_node.get_over_texture()

func get_progress_texture():
  return progress_texture_node.get_progress_texture()

func get_fill_mode():
  return progress_texture_node.get_fill_mode()

func get_radial_initial_angle():
  return progress_texture_node.get_radial_initial_angle()

func get_fill_degrees():
  return progress_texture_node.get_fill_degrees()

func get_radial_center_offset():
  return progress_texture_node.get_radial_center_offset()

# Range attributes
func set_exp_unit_value(value):
  progress_texture_node.set_exp_unit_value(value != null)

func set_rounded_values(value):
  progress_texture_node.set_rounded_values(value != null)

func set_max(value):
  progress_texture_node.set_max(value)

func set_min(value):
  progress_texture_node.set_min(value)

func set_page(value):
  progress_texture_node.set_page(value)

func set_step(value):
  progress_texture_node.set_step(value)

func set_value(value):
  progress_texture_node.set_value(value)

func is_unit_value_exp():
  return progress_texture_node.is_unit_value_exp()

func is_rounded_values():
  return progress_texture_node.is_rounded_values()

func get_max():
  return progress_texture_node.get_max()

func get_min():
  return progress_texture_node.get_min()

func get_page():
  return progress_texture_node.get_page()

func get_step():
  return progress_texture_node.get_step()

func get_value():
  return progress_texture_node.get_value()

func share(value):
  progress_texture_node.share(value)

func unshare():
  progress_texture_node.unshare()
