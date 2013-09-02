package unittests.mocks {
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import tools.ITool;
	
	/** @author Kristian Welsh */
	public class MockTool implements ITool {
		private var _mouseDownCalls:Vector.<Array> = new Vector.<Array>();
		private var _mouseMoveCalls:Vector.<Array> = new Vector.<Array>();
		private var _mouseUpCalls:Vector.<Array> = new Vector.<Array>();
		
		public function get mouseDownCalls():Vector.<Array> {
			return _mouseDownCalls;
		}
		
		public function get mouseMoveCalls():Vector.<Array> {
			return _mouseMoveCalls;
		}
		
		public function get mouseUpCalls():Vector.<Array> {
			return _mouseUpCalls;
		}
		
		public function get art():DisplayObject {
			return new Sprite();
		}
		
		public function mouseDown(x:Number, y:Number, fillColour:uint):void {
			_mouseDownCalls.push([x, y, fillColour]);
		}
		
		public function mouseMove(x:Number, y:Number):void {
			_mouseMoveCalls.push([x, y]);
		}
		
		public function mouseUp(x:Number, y:Number):void {
			_mouseUpCalls.push([x, y]);
		}
	}
}