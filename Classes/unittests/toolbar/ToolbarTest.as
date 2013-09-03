package unittests.toolbar {
	import asunit.framework.TestCase;
	import events.ToolbarEvent;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import toolbar.*;
	import tools.*;
	import tools.shapes.*;
	
	/** @author Kristian Welsh */
	public class ToolbarTest extends TestCase {
		private var _selectionEvents:Vector.<ToolbarEvent> = new Vector.<ToolbarEvent>();
		
		private var _target:Sprite;
		private var _cointainer:Sprite;
		private var _instance:Toolbar;
		
		private var _rectangleButton:Sprite;
		private var _ovalButton:Sprite;
		private var _brushButton:Sprite;
		private var _triangleButton:Sprite;
		
		public function ToolbarTest(testMethod:String):void {
			super(testMethod);
		}
		
		protected override function setUp():void {
			// TODO: long complicated out of class setup is a code smell for hidden dependancies, refactor the class.
			_rectangleButton = new Sprite();
			_rectangleButton.name = "rectangle_mc";
			_ovalButton = new Sprite();
			_ovalButton.name = "oval_mc";
			_brushButton = new Sprite();
			_brushButton.name = "brush_mc";
			_triangleButton = new Sprite();
			_triangleButton.name = "triangle_mc";
			
			_target = new Sprite();
			_target.addChild(_rectangleButton);
			_target.addChild(_ovalButton);
			_target.addChild(_brushButton);
			_target.addChild(_triangleButton);
			
			_cointainer = new Sprite();
			
			_instance = new Toolbar(_target, _cointainer);
		}
		
		public function should_add_target_as_a_child_to_cointainer():void {
			assertEquals(0, _cointainer.getChildIndex(_target));
		}
		
		public function should_dispatch_event_when_rectangle_button_is_clicked():void {
			_instance.addEventListener(ToolbarEvent.SELECT, recordSelection);
			_rectangleButton.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
			assertEquals(ToolType.RECTANGLE, _selectionEvents[0].toolType);
		}
		
		public function should_dispatch_event_when_oval_button_is_clicked():void {
			_instance.addEventListener(ToolbarEvent.SELECT, recordSelection);
			_ovalButton.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
			assertEquals(ToolType.OVAL, _selectionEvents[0].toolType);
		}
		
		public function should_dispatch_event_when_brush_button_is_clicked():void {
			_instance.addEventListener(ToolbarEvent.SELECT, recordSelection);
			_brushButton.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
			assertEquals(ToolType.BRUSH, _selectionEvents[0].toolType);
		}
		
		public function should_dispatch_event_when_triangle_button_is_clicked():void {
			_instance.addEventListener(ToolbarEvent.SELECT, recordSelection);
			_triangleButton.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
			assertEquals(ToolType.TRIANGLE, _selectionEvents[0].toolType);
		}
		
		private function recordSelection(event:ToolbarEvent):void {
			_selectionEvents.push(event);
		}
	}
}