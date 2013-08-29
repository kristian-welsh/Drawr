package unittests.tools{
	
	import asunit.framework.TestCase;
	import tools.RectangleTool;
	
	import flash.display.*;
	import flash.geom.*;

	public class RectangleToolTest extends TestCase {
		
		private var _rectangle_tool_instance:RectangleTool;
		
		/**
		 * Constructor.
		 */
		public function RectangleToolTest(testMethod:String):void {
			super(testMethod);
		}
		
		/**
		 * Creates a new brush tool to test with.
		 */
		protected override function setUp():void {
			_rectangle_tool_instance = new RectangleTool();
		}
		
		/**
		 * Removes the test brush tool.
		 */
		protected override function tearDown():void {
			_rectangle_tool_instance = null;
		}
		
		/**
		 * Tests the class's initialisation.
		 */
		public function testInitialisation():void {
			assertTrue("the instance is a RectangleTool",_rectangle_tool_instance is RectangleTool);
		}
		
		/**
		 * Tests that when you depress the mouse it edits the art.
		 */
		public function testMouseDown():void {
			_rectangle_tool_instance.mouseDown(0,0,0x000000);
			
			var modified_art:Shape = _rectangle_tool_instance.art as Shape;
			
			assertFalse("returned art after mouseDown is empty",hasContent(modified_art));
		}
		
		/**
		 * Tests that when you press and move the moouse stuff is drawn between where you pressed and where you move to.
		 */
		public function testMouseMove():void {
			_rectangle_tool_instance.mouseDown(0,0,0x000000);//required
			_rectangle_tool_instance.mouseMove(100,100);
			
			var modified_art:Shape = _rectangle_tool_instance.art as Shape;
			
			assertTrue("returned art after mouseDown then mouseMove isn't empty",hasContent(modified_art));
		}
		
		/**
		 * Test of the empty mouseUp function put in to fulfil the interface, true automatically.
		 */
		public function testMouseUp():void {
			_rectangle_tool_instance.mouseDown(0,0,0x000000);//required
			_rectangle_tool_instance.mouseMove(100,100);//required
			
			var bmp1:BitmapData = bitmapData(_rectangle_tool_instance.art);//art before being drawn
			
			_rectangle_tool_instance.mouseUp(100,100);
			
			var bmp2:BitmapData = bitmapData(_rectangle_tool_instance.art);//art after being drawn
			
			assertTrue("returned art after mouseDown, mouseMove, then mouseUp isn't empty",hasContent(_rectangle_tool_instance.art));
			assertFalse("art while drawing and art after drawn aren't the same",areSameBitmapData(bmp1,bmp2));
			assertEquals("",bmp1.width,bmp2.width);
			assertEquals("",bmp1.height,bmp2.height);
		}
		
		/**
		 * Tests whether getArt returns a bitmap display object.
		 */
		public function testGetArt():void {
			_rectangle_tool_instance.mouseDown(0,0,0x000000);
			assertTrue("returns an empty DisplayObject after mouseDown",_rectangle_tool_instance.art is DisplayObject);
		}
		
		
		//----UTILITY----//
		
		/**
		 * Returns true if display_object has graphics, otherwise returns false.
		 */
		private function hasContent(display_object:DisplayObject):Boolean {
			var drawn_bmp_data:BitmapData = new BitmapData(500,500);
			drawn_bmp_data.draw(display_object);
			//draw disply_object's contents to a comparison BitmapData object
			var new_bmp_data:BitmapData = new BitmapData(500,500);
			// create empty BitmapData for comparison.
			return !areSameBitmapData(drawn_bmp_data,new_bmp_data);
		}
		
		/**
		 * Returns true if bmp_data_1 is the same as bmp_data_2, otherwise returns false.
		 */
		private function areSameBitmapData(bmp_data_1:BitmapData,bmp_data_2:BitmapData):Boolean {
			var are_different:Boolean = Boolean(bmp_data_1.compare(bmp_data_2));
			return !are_different;
		}
		
		/**
		 * Returns true if display_object_1 has the same graphics as display_object_2, otherwise returns false.
		 */
		private function areSameDisplayObject(display_object_1:DisplayObject,display_object_2:DisplayObject):Boolean {
			var bmp_data_1:BitmapData = new BitmapData(500,500);
			bmp_data_1.draw(display_object_1);
			var bmp_data_2:BitmapData = new BitmapData(500,500);
			bmp_data_2.draw(display_object_2);
			
			return areSameBitmapData(bmp_data_1,bmp_data_2);
		}
		
		/**
		 * Returns a BitmapData containing the OBJECT's rasterised graphics.
		 */
		private function bitmapData(OBJECT:DisplayObject):BitmapData{
			var object:DisplayObject = OBJECT;
			var return_me:BitmapData = new BitmapData (OBJECT.width,OBJECT.height);
			return_me.draw(object);
			return return_me;
		}
	}
}