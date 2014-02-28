package canvas {
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	import tools.ITool;
	import tools.NullTool;
	
	public class Canvas implements ICanvas {
		private var _target:DisplayObjectContainer;
		private var _container:DisplayObjectContainer;
		private var _currentTool:ITool = NullTool.nullTool;
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
		
		public function Canvas(target:DisplayObjectContainer, container:DisplayObjectContainer):void {
			target.x = 55;
			target.y = 10;
			container.addChild(target);
			target.addEventListener(MouseEvent.MOUSE_DOWN, onCanvasDown);
			_target = target;
			_container = container;
		}
		
		private function onCanvasDown(event:MouseEvent):void {
			addDrawingListeners();
			_currentTool.mouseDown(_target.mouseX, _target.mouseY, _fillColour);
			_target.addChild(_currentTool.art);
		}
		
		private function addDrawingListeners():void {
			_container.addEventListener(MouseEvent.MOUSE_MOVE, onCanvasMove);
			_container.addEventListener(MouseEvent.MOUSE_UP, onCanvasUp);
		}
		
		private function onCanvasMove(event:MouseEvent):void {
			_currentTool.mouseMove(_target.mouseX, _target.mouseY);
		}
		
		private function onCanvasUp(event:MouseEvent):void {
			removeDrawingListeners();
			_currentTool.mouseUp(_target.mouseX, _target.mouseY);
		}
		
		private function removeDrawingListeners():void {
			_container.removeEventListener(MouseEvent.MOUSE_MOVE, onCanvasMove);
			_container.removeEventListener(MouseEvent.MOUSE_UP, onCanvasUp);
		}
	}
}