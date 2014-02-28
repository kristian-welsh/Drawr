package unittests {
	import asunit.framework.TestSuite;
	import unittests.canvas.*;
	import unittests.toolbar.*;
	import unittests.toolcolourpicker.*;
	import unittests.tools.*;
	import unittests.tools.shapes.*;
	
	/** @author Kristian Welsh */
	public class AllTests extends TestSuite {
		public function AllTests() {
			addTest(new DrawrTest("should_assign_canvas_a_tool_when_a_toolbar_icon_is_selected"));
			addTest(new DrawrTest("should_assign_canvas_a_colour_when_the_colourpicker_is_used"));
			
			addTest(new CanvasTest("should_add_target_as_a_child_of_container_on_initialization"));
			addTest(new CanvasTest("should_update_tool_correctly_on_mouseDown"));
			addTest(new CanvasTest("should_update_tool_correctly_on_mouseMove"));
			addTest(new CanvasTest("should_update_tool_correctly_on_mouseUp"));
			
			addTest(new ToolbarTest("should_add_target_as_a_child_to_cointainer"));
			addTest(new ToolbarTest("should_dispatch_event_when_rectangle_button_is_clicked"));
			addTest(new ToolbarTest("should_dispatch_event_when_oval_button_is_clicked"));
			addTest(new ToolbarTest("should_dispatch_event_when_brush_button_is_clicked"));
			
			addTest(new ToolbarButtonTest("should_repeat_click_events_from_target"));
			
			addTest(new ToolColourPickerTest("should_add_self_as_a_child_of_container_on_initialization"));
			
			addTest(new ToolFactoryTest("should_produce_rectangle_tool_correctly"));
			addTest(new ToolFactoryTest("should_produce_oval_tool_correctly"));
			addTest(new ToolFactoryTest("should_produce_brush_tool_correctly"));
			addTest(new ToolFactoryTest("should_produce_null_tool_correctly"));
			
			addTest(new BrushToolTest("should_have_art_after_mouseDown"));
			addTest(new BrushToolTest("should_have_different_art_after_mouseMove_than_after_mouseDown"));
			
			addTest(new OvalToolTest("should_not_have_art_after_mouseDown"));
			addTest(new OvalToolTest("should_have_art_after_mouseMove"));
			addTest(new OvalToolTest("should_have_art_after_mouseUp"));
			
			addTest(new RectangleToolTest("should_not_have_art_after_mouseDown"));
			addTest(new RectangleToolTest("should_have_art_after_mouseMove"));
			addTest(new RectangleToolTest("should_have_art_after_mouseUp"));
			
			addTest(new TriangleToolTest("should_not_have_art_after_mouseDown"));
			addTest(new TriangleToolTest("should_have_art_after_mouseMove"));
			addTest(new TriangleToolTest("should_have_art_after_mouseUp"));
		}
	}
}