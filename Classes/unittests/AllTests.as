package unittests {
	import asunit.framework.TestSuite;
	import unittests.canvas.CanvasTest;
	import unittests.tools.ToolFactoryTest;
	import unittests.tools.*;
	
	/** @author Kristian Welsh */
	public class AllTests extends TestSuite {
		public function AllTests() {
			addTest(new DrawrTest("should_assign_canvas_a_tool_when_a_toolbar_icon_is_selected"));
			addTest(new DrawrTest("should_assign_canvas_a_colour_when_the_colourpicker_is_used"));
			
			addTest(new CanvasTest("should_add_target_as_a_child_of_container_on_initialization"));
			addTest(new CanvasTest("should_update_tool_correctly_on_mouseDown"));
			addTest(new CanvasTest("should_update_tool_correctly_on_mouseMove"));
			addTest(new CanvasTest("should_update_tool_correctly_on_mouseUp"));
			
			addTest(new ToolFactoryTest("should_produce_rectangle_tool_correctly"));
			addTest(new ToolFactoryTest("should_produce_oval_tool_correctly"));
			addTest(new ToolFactoryTest("should_produce_brush_tool_correctly"));
			addTest(new ToolFactoryTest("should_produce_null_tool_correctly"));
			
			addTest(new BrushToolTest("should_have_art_after_mouseDown"));
			addTest(new BrushToolTest("should_have_different_art_after_mouseMove_than_after_mouseDown"));
			
			addTest(new OvalToolTest("should_not_have_art_after_mouseDown_alone"));
			addTest(new OvalToolTest("should_have_art_after_mouseDown_then_mouseMove"));
			addTest(new OvalToolTest("should_have_different_art_after_mouseMove_than_after_mouseDown"));
			
			addTest(new RectangleToolTest("should_not_have_art_after_mouseDown_alone"));
			addTest(new RectangleToolTest("should_have_art_after_mouseDown_then_mouseMove"));
			addTest(new RectangleToolTest("should_have_different_art_after_mouseMove_than_after_mouseDown"));
		}
	}
}