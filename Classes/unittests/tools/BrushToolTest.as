package unittests.tools {
	import asunit.framework.TestCase;
	import flash.display.*;
	import flash.geom.*;
	import tools.BrushTool;
	
	public class BrushToolTest extends TestCase {
		private var _instance:BrushTool;
		
		public function BrushToolTest(testMethod:String):void {
			super(testMethod);
		}
		
		protected override function setUp():void {
			_instance = new BrushTool();
		}
		
		public function testMouseDown():void {
			_instance.mouseDown(100, 100, 0x000000);
			
			var modified_art:Bitmap = _instance.art as Bitmap;
			var newbmd:BitmapData = new BitmapData(500, 500, true, 0x00000000);
			
			var bounds:Rectangle = modified_art.bitmapData.getColorBoundsRect(0xFF000000, 0x00000000, false);
			var has_graphics:Boolean = !(bounds.width == 0 && bounds.height == 0);
			
			assertEquals("mouseDown adds a spot of width 19 to the canvas", bounds.width, 19);
			assertEquals("mouseDown adds a spot of height 19 to the canvas", bounds.height, 19);
			assertTrue("mouseDown creates some art", (modified_art.bitmapData.compare(newbmd) != 0));
		}
		
		public function testMouseMove():void {
			_instance.mouseDown(0, 0, 0x000000);
			_instance.mouseMove(100, 100);
			_instance.mouseMove(100, 0);
			_instance.mouseMove(0, 0);
			
			var modified_art:Bitmap = _instance.art as Bitmap;
			
			var bounds:Rectangle = modified_art.bitmapData.getColorBoundsRect(0xFF000000, 0x00000000, false);
			
			assertEquals("mouseMove adds graphics to the canvas", bounds.width, 110);
			assertEquals("mouseMove adds graphics to the canvas", bounds.height, 110);
		}
	}
}