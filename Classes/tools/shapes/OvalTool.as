package tools.shapes {
	/** @author Kristian Welsh */
	public class OvalTool extends ShapeTool {
		protected override function drawShape(x1:Number, y1:Number, x2:Number, y2:Number):void {
			_art.graphics.drawEllipse(x1, y1, x2, y2);
		}
	}
}