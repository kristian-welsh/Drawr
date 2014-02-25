package unittests.tools {
	import asunit.framework.TestCase;
	import drawers.ArtDrawer;
	import drawers.BitmapDrawer;
	import flash.display.*;
	import flash.geom.*;
	import tools.BrushTool;
	
	public class BrushToolTest extends TestCase {
		private var _instance:BrushTool;
		
		// note to self, i have a seam now, use it.
		public function BrushToolTest(testMethod:String):void {
			super(testMethod);
		}
		
		protected override function setUp():void {
			var drawer:ArtDrawer = new BitmapDrawer();
			_instance = new BrushTool();
		}
		
		public function should_have_art_after_mouseDown():void {
			_instance.mouseDown(0, 0, 0x000000);
			assertInstanceHasContent();
		}
		
		public function should_have_different_art_after_mouseMove_than_after_mouseDown():void {
			_instance.mouseDown(0, 0, 0x000000);
			var artBeforeMove:BitmapData = toBitmapData(_instance.art);
			_instance.mouseMove(100, 100);
			var artAfterMove:BitmapData = toBitmapData(_instance.art);
			
			assertFalse(areIdentical(artBeforeMove, artAfterMove));
			assertTrue(hasContent(_instance.art));
		}
		
		private function assertInstanceHasContent():void {
			assertTrue(hasContent(_instance.art));
		}
		
		private function hasContent(input:DisplayObject):Boolean {
			var comparison1:BitmapData = new BitmapData(500, 500);
			comparison1.draw(input);
			var comparison2:BitmapData = new BitmapData(500, 500);
			return !areIdentical(comparison1, comparison2);
		}
		
		private function areIdentical(input1:BitmapData, input2:BitmapData):Boolean {
			return input1.compare(input2) == 0;
		}
		
		private function toBitmapData(input:DisplayObject):BitmapData {
			var returnMe:BitmapData = new BitmapData(input.width, input.height);
			returnMe.draw(input);
			return returnMe;
		}
	}
}