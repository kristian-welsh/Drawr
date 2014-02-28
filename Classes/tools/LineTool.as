package tools {
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import tools.ITool;
	
	/** @author Kristian Welsh */
	public class LineTool implements ITool {
		private var _art:Bitmap = new Bitmap();
		
		public function get art():DisplayObject {
			return _art;
		}
		
		public function mouseDown(x:Number, y:Number, fillColour:uint):void {
			
		}
		
		public function mouseMove(x:Number, y:Number):void {
			
		}
		
		public function mouseUp(x:Number, y:Number):void {
			
		}
	}
}