package unittests {
	import asunit.framework.TestSuite;
	import unittests.tools.*;
	
	public class AllTests extends TestSuite {
		public function AllTests() {
			addTest(new DrawrTest("testOnToolbarSelect"));
			addTest(new DrawrTest("testOnFillColourChange"));
			
			addTest(new BrushToolTest("should_have_art_after_mouseDown"));
			addTest(new BrushToolTest("should_have_different_art_after_mouseMove_than_after_mouseDown"));
			
			addTest(new OvalToolTest("should_not_have_art_after_mouse_down_alone"));
			addTest(new OvalToolTest("should_have_art_after_mouse_down_then_mouse_move"));
			addTest(new OvalToolTest("should_have_different_art_after_mouse_move_than_after_mouse_down"));
			
			addTest(new RectangleToolTest("should_not_have_art_after_mouse_down_alone"));
			addTest(new RectangleToolTest("should_have_art_after_mouse_down_then_mouse_move"));
			addTest(new RectangleToolTest("should_have_different_art_after_mouse_move_than_after_mouse_down"));
		}
	}
}