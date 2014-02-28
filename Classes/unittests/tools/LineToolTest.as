package unittests.tools {
	import asunit.framework.TestCase;
	import tools.LineTool;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	
	/** @author Kristian Welsh */
	public class LineToolTest extends TestCase {
		public function LineToolTest(testMethod:String):void {
			super(testMethod);
		}
		
		public function should_not_have_art_after_mouseDown():void {
			var instance:LineTool = new LineTool();
			instance.mouseDown(0, 0, 0x000000);
			assertInstanceHasContent(instance);
		}
		
		private function assertInstanceHasContent(tool:LineTool):void {
			assertTrue(hasContent(tool.art));
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
	}
}