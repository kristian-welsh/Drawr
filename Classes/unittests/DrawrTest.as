package unittests{
	import asunit.framework.TestCase;
	
	import flash.events.Event;
	
	import events.ToolbarEvent;
	import toolbar.ToolType;
	import tools.*;
	
	public class DrawrTest extends TestCase {
		
		private var _drawr_instance:Drawr;
		
		/**
		 * Constructor.
		 */
		public function DrawrTest(testMethod:String):void {
			super(testMethod);
		}
		
		/**
		 * Set up an instance of Drawr to test with.
		 */
		protected override function setUp():void {
			_drawr_instance = new Drawr();
		}
		
		/**
		 * Delete testing instance.
		 */
		protected override function tearDown():void {
			_drawr_instance = null;
		}
		
		/**
		 * Test Initialisation.
		 */
		public function testInitialisation():void {
			
			assertTrue("drawr is the right class type",
					   _drawr_instance is Drawr);
			
			assertTrue("drawr has canvas",
					   _drawr_instance.canvas);
			
			assertTrue("drawr has toolbar",
					   _drawr_instance.toolbar);
			
			assertTrue("drawr's toolbar has a ToolbarEvent",
					   _drawr_instance.toolbar.hasEventListener(ToolbarEvent.SELECT));
			
		}
		
		/**
		 * Test OnToolbarSelect.
		 */
		public function testOnToolbarSelect():void {
			
			_drawr_instance.onToolbarSelect(new ToolbarEvent(ToolbarEvent.SELECT,ToolType.RECTANGLE))
			assertTrue("selecing the rectangle sets tool to rectangle",
					   _drawr_instance.canvas.currentTool is RectangleTool);
			
			_drawr_instance.onToolbarSelect(new ToolbarEvent(ToolbarEvent.SELECT,ToolType.OVAL))
			assertTrue("then selecing the oval sets tool to oval",
					   _drawr_instance.canvas.currentTool is OvalTool);
			
			_drawr_instance.onToolbarSelect(new ToolbarEvent(ToolbarEvent.SELECT,ToolType.BRUSH))
			assertTrue("then selecing the brush sets tool to brush",
					   _drawr_instance.canvas.currentTool is BrushTool);
			
			_drawr_instance.onToolbarSelect(new ToolbarEvent(ToolbarEvent.SELECT,""))
			assertFalse("then selecting a non-indexed tool sets tool to null",
						_drawr_instance.canvas.currentTool);
			
		}
		
		/**
		 * Test OnFillColourChange.
		 */
		public function testOnFillColourChange():void {
			
			_drawr_instance.onFillColourChange(new Event(Event.CHANGE, true, false));
			assertEquals("selecting a colour sets the canvas fillColour to that colour",
						 _drawr_instance.canvas.fillColour,
						 _drawr_instance.picker.selectedColor);
			
		}
	}
}