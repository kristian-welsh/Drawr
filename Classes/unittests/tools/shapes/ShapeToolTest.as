package unittests.tools.shapes {
	import asunit.framework.TestCase;
	import flash.display.DisplayObject;
	import tools.shapes.ShapeTool;
	
	/** @author Kristian Welsh */
	public class ShapeToolTest extends TestCase {
		protected var _instance:ShapeTool;
		
		public function ShapeToolTest(testMethod:String):void {
			super(testMethod);
		}
		
		public function should_not_have_art_after_mouseDown():void {
			_instance.mouseDown(0, 0, 0x000000);
			assertFalse(hasContent(_instance.art));
		}
		
		private function hasContent(input:DisplayObject):Boolean {
			return !(input.width == 0 && input.height == 0);
		}
		
		public function should_have_art_after_mouseMove():void {
			_instance.mouseMove(100, 100);
			assertTrue(hasContent(_instance.art));
		}
		
		public function should_have_art_after_mouseUp():void {
			_instance.mouseUp(100, 100);
			assertTrue(hasContent(_instance.art));
		}
	}
}