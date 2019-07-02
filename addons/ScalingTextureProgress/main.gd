tool
extends EditorPlugin

func _enter_tree():
  # Initialization of the plugin goes here
  add_custom_type('ScalingTextureProgress', 'MarginContainer', preload('res://addons/ScalingTextureProgress/script.gd'), preload('res://addons/ScalingTextureProgress/icon.png'))

func _exit_tree():
  # Clean-up of the plugin goes here
  remove_custom_type('ScalingTextureProgress')
