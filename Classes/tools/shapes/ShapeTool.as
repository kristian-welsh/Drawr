package tools.shapes {
	import flash.display.*;
	import tools.ITool
	
	/** @author Kristian Welsh */
	public class ShapeTool implements ITool {
		protected var _art:Shape = new Shape();
		private var _fillColour:uint = 0x000000;
		
		public function mouseDown(x:Number, y:Number, fillColour:uint):void {
			_art = new Shape();
			_art.x = x;
			_art.y = y;
			_fillColour = fillColour
		}
		
		public function mouseMove(x:Number, y:Number):void {
			lineOnlyDraw(x, y)
		}
		
		private function lineOnlyDraw(x:Number, y:Number):void {
			_art.graphics.clear();
			_art.graphics.lineStyle(0.1, _fillColour, 1);
			drawShape(0, 0, x - _art.x, y - _art.y);
		}
		
		protected function drawShape(x1:Number, y1:Number, x2:Number, y2:Number):void {
			throw new Error("This function should be overriden");
		}
		
		private function fillDraw(x:Number, y:Number):void {
			_art.graphics.clear();
			_art.graphics.beginFill(_fillColour, 1);
			drawShape(0, 0, x - _art.x, y - _art.y);
		}
		
		public function mouseUp(x:Number, y:Number):void {
			fillDraw(x, y);
		}
		
		public function get art():DisplayObject {
			return _art;
		}
	}
}