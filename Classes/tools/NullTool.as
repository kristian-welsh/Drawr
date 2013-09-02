package tools {
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import tools.ITool;
	
	/** @author Kristian Welsh */
	public class NullTool implements ITool {
		public static const nullTool:NullTool = new NullTool();
		
		public function get art():DisplayObject {
			return new Sprite();
		}
		
		public function mouseDown(x:Number, y:Number, fillColour:uint):void {
		
		}
		
		public function mouseMove(x:Number, y:Number):void {
		
		}
		
		public function mouseUp(x:Number, y:Number):void {
		
		}
	}
}