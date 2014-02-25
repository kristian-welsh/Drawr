package unittests.canvas {
	import asunit.framework.TestCase;
	import canvas.Canvas;
	import flash.events.MouseEvent;
	import flash.display.*;
	import unittests.mocks.MockTool;
	
	public class CanvasTest extends TestCase {
		static private const TEST_COLOUR:Number = 0xFF0000;
		
		private var _target:Sprite;
		private var _container:Sprite;
		private var _instance:Canvas;
		private var _tool:MockTool;
		
		public function CanvasTest(testMethod:String):void {
			super(testMethod);
		}
		
		protected override function setUp():void {
			_target = new Sprite();
			_container = new Sprite();
			_instance = new Canvas(_target, _container);
			_tool = new MockTool();
			_instance.currentTool = _tool;
			_instance.fillColour = TEST_COLOUR;
		}
		
		public function should_add_target_as_a_child_of_container_on_initialization():void {
			assertEquals(0, _container.getChildIndex(_target));
		}
		
		public function should_update_tool_correctly_on_mouseDown():void {
			trigerMouseDown();
			assertCorrectDownUpdate();
		}
		
		private function trigerMouseDown():void {
			_target.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_DOWN));
		}
		
		private function assertCorrectDownUpdate():void {
			assertTrue(_tool.mouseDownCalls[0][0] != null);
			assertTrue(_tool.mouseDownCalls[0][1] != null);
			assertEquals(TEST_COLOUR, _tool.mouseDownCalls[0][2]);
			assertTrue(_target.numChildren > 0);
		}
		
		public function should_update_tool_correctly_on_mouseMove():void {
			trigerMouseMove();
			assertCorrectMoveUpdate();
		}
		
		private function trigerMouseMove():void {
			_target.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_DOWN));
			_target.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_MOVE));
		}
		
		private function assertCorrectMoveUpdate():void {
			assertTrue(_tool.mouseMoveCalls[0][0] != null);
			assertTrue(_tool.mouseMoveCalls[0][1] != null);
		}
		
		public function should_update_tool_correctly_on_mouseUp():void {
			trigerMouseUp();
			assertCorrectMouseUp();
		}
		
		private function trigerMouseUp():void {
			_target.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_DOWN));
			_target.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_UP));
		}
		
		private function assertCorrectMouseUp():void {
			assertTrue(_tool.mouseUpCalls[0][0] != null);
			assertTrue(_tool.mouseUpCalls[0][1] != null);
		}
	}
}