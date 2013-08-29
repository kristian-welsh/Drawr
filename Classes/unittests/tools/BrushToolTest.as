package unittests.tools{
	
	import asunit.framework.TestCase;
	import tools.BrushTool;
	
	import flash.display.*;
	import flash.geom.*;

	public class BrushToolTest extends TestCase {
		
		private var _brush_tool_instance:BrushTool;
		
		/**
		 * Constructor.
		 */
		public function BrushToolTest(testMethod:String):void {
			super(testMethod);
		}
		
		/**
		 * Creates a new brush tool to test with.
		 */
		protected override function setUp():void {
			_brush_tool_instance = new BrushTool();
		}
		
		/**
		 * Removes the test brush tool.
		 */
		protected override function tearDown():void {
			_brush_tool_instance = null;
		}
		
		/**
		 * Tests the class's initialisation.
		 */
		public function testInitialisation():void {
			assertTrue("the instance is a BrushTool",_brush_tool_instance is BrushTool);
		}
		
		/**
		 * Tests that when you depress the mouse it edits the art.
		 */
		public function testMouseDown():void {
			_brush_tool_instance.mouseDown(100,100,0x000000);
			
			var modified_art:Bitmap = _brush_tool_instance.art as Bitmap;
			var newbmd:BitmapData = new BitmapData(500,500,true,0x00000000);
			
			var bounds:Rectangle = modified_art.bitmapData.getColorBoundsRect(0xFF000000, 0x00000000, false);
			var has_graphics:Boolean = !(bounds.width == 0 && bounds.height == 0);
			
			assertEquals("mouseDown adds a spot of width 19 to the canvas", bounds.width, 19);
			assertEquals("mouseDown adds a spot of height 19 to the canvas", bounds.height, 19);
			assertTrue("mouseDown creates some art",(modified_art.bitmapData.compare(newbmd)!=0));
		}
		
		/**
		 * Tests that when you press and move the moouse stuff is drawn between where you pressed and where you move to.
		 */
		public function testMouseMove():void {
			_brush_tool_instance.mouseDown(0,0,0x000000);//required
			_brush_tool_instance.mouseMove(100,100);
			_brush_tool_instance.mouseMove(100,0);
			_brush_tool_instance.mouseMove(0,0);
			
			var modified_art:Bitmap = _brush_tool_instance.art as Bitmap;
			
			var bounds:Rectangle = modified_art.bitmapData.getColorBoundsRect(0xFF000000, 0x00000000, false);
			
			assertEquals("mouseMove adds graphics to the canvas", bounds.width,110);
			assertEquals("mouseMove adds graphics to the canvas", bounds.height,110);
		}
		
		/**
		 * Test of the empty mouseUp function put in to fulfil the interface, true automatically.
		 */
		public function testMouseUp():void {
			_brush_tool_instance.mouseUp(50,90);
			assertTrue("empty interface function, true automatically",true)
		}
		
		/**
		 * Tests whether getArt returns a bitmap display object.
		 */
		public function testGetArt():void {
			assertTrue("returns an epmty bitmap before being drawn in",_brush_tool_instance.art is Bitmap);
		}
	}
}