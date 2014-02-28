package unittests {
	import asunit.framework.TestCase;
	import canvas.*;
	import events.ToolbarEvent;
	import flash.events.Event;
	import toolbar.*;
	import tools.BrushTool;
	import unittests.mocks.*;
	
	public class DrawrTest extends TestCase {
		private var _instance:Drawr;
		private var _canvas:MockCanvas;
		private var _toolbar:IToolbar;
		private var _colourPicker:MockColorPicker;
		
		public function DrawrTest(testMethod:String):void {
			super(testMethod);
		}
		
		protected override function setUp():void {
			_canvas = new MockCanvas();
			_toolbar = new MockToolbar();
			_colourPicker = new MockColorPicker();
			var parameters:Object = {
				canvas:_canvas,
				toolbar:_toolbar,
				colourPicker:_colourPicker
			}
			_instance = new Drawr(parameters);
		}
		
		public function should_assign_canvas_a_tool_when_a_toolbar_icon_is_selected():void {
			_toolbar.dispatchEvent(new ToolbarEvent(ToolbarEvent.SELECT, ToolType.BRUSH));
			assertTrue(_canvas.currentToolAssignments[0] is BrushTool);
		}
		
		public function should_assign_canvas_a_colour_when_the_colourpicker_is_used():void {
			_colourPicker.selectedColor = 0x000000;
			_colourPicker.dispatchEvent(new Event(Event.CHANGE));
			assertEquals(_canvas.fillColourAssignments[0], 0x000000);
		}
	}
}