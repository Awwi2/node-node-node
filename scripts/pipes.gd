extends Node2D

func set_pipes(ports):
	for p in ports:
		if p == Vector2i.RIGHT:
			$PipeRight.visible = true
		if p == Vector2i.LEFT:
			$PipeLeft.visible = true
		if p == Vector2i.UP:
			$PipeUp.visible = true
		if p == Vector2i.DOWN:
			$PipeDown.visible = true
