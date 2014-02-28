package tools.shapes {
	/** @author Kristian Welsh */
	public class RectangleTool extends ShapeTool {
		protected override function drawShape(x1:Number, y1:Number, x2:Number, y2:Number):void {
			_art.graphics.drawRect(x1, y1, x2, y2);
		}
	}
}