package canvas {
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	import tools.ITool;
	
	public class Canvas {
		
		private var _target:Sprite;
		private var _currentTool:ITool;
		private var _fillColour:uint;
		
		public function get currentTool():ITool {
			return _currentTool;
		}
		
		public function set currentTool(value:ITool):void {
			_currentTool = value;
		}
		
		public function get fillColour():uint {
			return _fillColour;
		}
		
		public function set fillColour(value:uint):void {
			_fillColour = value;
		}
		
		public function Canvas(target:Sprite):void {
			_target = target;
			_target.addEventListener(MouseEvent.MOUSE_DOWN, onCanvasDown);
		}
		
		private function onCanvasDown(me:MouseEvent):void {
			if (!_currentTool)
				return;
			_target.stage.addEventListener(MouseEvent.MOUSE_MOVE, onCanvasMove);
			_target.stage.addEventListener(MouseEvent.MOUSE_UP, onCanvasUp);
			_currentTool.mouseDown(_target.mouseX, _target.mouseY, _fillColour);
			_target.addChild(_currentTool.art);
		}
		
		private function onCanvasMove(me:MouseEvent):void {
			var newX:Number = _target.mouseX;
			var newY:Number = _target.mouseY;
			_currentTool.mouseMove(newX, newY);
		}
		
		private function onCanvasUp(me:MouseEvent):void {
			_target.stage.removeEventListener(MouseEvent.MOUSE_MOVE, onCanvasMove);
			_target.stage.removeEventListener(MouseEvent.MOUSE_UP, onCanvasUp);
			_currentTool.mouseUp(_target.mouseX, _target.mouseY);
		}
	}
}