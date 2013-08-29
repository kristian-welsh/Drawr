package unittests {
	import asunit.framework.TestCase;
	import events.ToolbarEvent;
	import flash.events.Event;
	import toolbar.ToolType;
	import tools.*;
	
	public class DrawrTest extends TestCase {
		private var _instance:Drawr = new Drawr();
		
		public function DrawrTest(testMethod:String):void {
			super(testMethod);
		}
		
		public function testOnToolbarSelect():void {
			_instance.onToolbarSelect(new ToolbarEvent(ToolbarEvent.SELECT, ToolType.RECTANGLE))
			assertTrue("selecing the rectangle sets tool to rectangle", _instance.canvas.currentTool is RectangleTool);
			
			_instance.onToolbarSelect(new ToolbarEvent(ToolbarEvent.SELECT, ToolType.OVAL))
			assertTrue("then selecing the oval sets tool to oval", _instance.canvas.currentTool is OvalTool);
			
			_instance.onToolbarSelect(new ToolbarEvent(ToolbarEvent.SELECT, ToolType.BRUSH))
			assertTrue("then selecing the brush sets tool to brush", _instance.canvas.currentTool is BrushTool);
			
			_instance.onToolbarSelect(new ToolbarEvent(ToolbarEvent.SELECT, ""))
			assertFalse("then selecting a non-indexed tool sets tool to null", _instance.canvas.currentTool);
		}
		
		public function testOnFillColourChange():void {
			_instance.onFillColourChange(new Event(Event.CHANGE, true, false));
			assertEquals("selecting a colour sets the canvas fillColour to that colour", _instance.canvas.fillColour, _instance.picker.selectedColor);
		}
	}
}