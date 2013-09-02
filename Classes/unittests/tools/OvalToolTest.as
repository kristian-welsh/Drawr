package unittests.tools {
	import asunit.framework.TestCase;
	import flash.display.*;
	import flash.geom.*;
	import tools.OvalTool;
	
	public class OvalToolTest extends TestCase {
		private var _instance:OvalTool = new OvalTool();
		
		//TODO: merge this test in with the oval test when the ovaltool and rectangletool merge subclass the shape tool.
		
		public function OvalToolTest(testMethod:String):void {
			super(testMethod);
		}
		
		public function should_not_have_art_after_mouseDown_alone():void {
			_instance.mouseDown(0, 0, 0x000000);
			assertFalse(hasContent(_instance.art));
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
		
		public function should_have_art_after_mouseDown_then_mouseMove():void {
			_instance.mouseDown(0, 0, 0x000000);
			_instance.mouseMove(100, 100);
			assertTrue(hasContent(_instance.art));
		}
		
		public function should_have_different_art_after_mouseMove_than_after_mouseDown():void {
			_instance.mouseDown(0, 0, 0x000000);
			_instance.mouseMove(100, 100);
			
			var bmdBeforeMouseUp:BitmapData = toBitmapData(_instance.art);
			_instance.mouseUp(100, 100);
			var bmdAfterMouseUp:BitmapData = toBitmapData(_instance.art);
			
			assertFalse(areIdentical(bmdBeforeMouseUp, bmdAfterMouseUp));
			assertTrue(hasContent(_instance.art));
		}
		
		private function toBitmapData(input:DisplayObject):BitmapData {
			var returnMe:BitmapData = new BitmapData(input.width, input.height);
			returnMe.draw(input);
			return returnMe;
		}
	}
}