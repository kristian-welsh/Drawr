package tools {
	import toolbar.ToolType;
	import tools.*;
	import tools.shapes.*;
	
	/** @author Kristian Welsh */
	public class ToolFactory {
		public static function makeTool(toolType:String):ITool {
			switch (toolType) {
				case ToolType.RECTANGLE:
					return new RectangleTool();
				case ToolType.OVAL:
					return new OvalTool();
				case ToolType.BRUSH:
					return new BrushTool();
				case ToolType.TRIANGLE:
					return new TriangleTool();
				default:
					return NullTool.nullTool;
			}
		}
	}
}