﻿package tools {
	import flash.display.DisplayObject;
	
	public interface ITool {
		
		function mouseDown(x:Number, y:Number, fillColour:uint):void;
		function mouseMove(x:Number, y:Number):void;
		function mouseUp(x:Number, y:Number):void;
		
		function get art():DisplayObject;
		
	}
}