package tools {
	import toolbar.ToolType;
	import tools.BrushTool;
	import tools.ITool;
	import tools.NullTool;
	import tools.OvalTool;
	import tools.RectangleTool;
	
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
				default:
					return NullTool.nullTool;
			}
		}
	}
}