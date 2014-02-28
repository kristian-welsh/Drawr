package tools.shapes {
	/** @author Kristian Welsh */
	public class TriangleTool extends ShapeTool {
		protected override function drawShape(x1:Number, y1:Number, x2:Number, y2:Number):void {
			var middleX:Number = x1 + ((x2 - x1) / 2);
			var vector:Vector.<Number> = Vector.<Number>([middleX, y1, x1, y2, x2, y2]);
			_art.graphics.drawTriangles(vector);
		}
	}
}