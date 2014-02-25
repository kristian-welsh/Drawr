package unittests.tools {
	import asunit.framework.TestCase;
	import toolbar.ToolType;
	import tools.*;
	import tools.shapes.*;
	
	public class ToolFactoryTest extends TestCase {
		public function ToolFactoryTest(testMethod:String):void {
			super(testMethod);
		}
		
		public function should_produce_rectangle_tool_correctly():void {
			assertTrue(ToolFactory.makeTool(ToolType.RECTANGLE) is RectangleTool);
		}
		
		public function should_produce_oval_tool_correctly():void {
			assertTrue(ToolFactory.makeTool(ToolType.OVAL) is OvalTool);
		}
		
		public function should_produce_brush_tool_correctly():void {
			assertTrue(ToolFactory.makeTool(ToolType.BRUSH) is BrushTool);
		}
		
		public function should_produce_null_tool_correctly():void {
			assertTrue(ToolFactory.makeTool("foo") is NullTool);
		}
	}
}