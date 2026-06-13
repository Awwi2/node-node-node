@abstract class_name Nodey
extends Node2D

var activated : bool = false
var pos : Vector2i
var neighbours : Array[Nodey]
var ports : Array[Vector2i]

@abstract func activate(damage:float,shield:float,heal:float,other:Array, prev:Nodey)
