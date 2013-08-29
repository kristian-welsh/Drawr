package tools {
	import flash.display.*;
	import flash.geom.Point;
	
	public class OvalTool implements ITool{
		
		//refactor rectangle and oval to extend a shape class that does protected _art, _fillcolour, lineTempDraw, and fillDraw
		//also refactor them with shift functionality
		
		private var _art:Shape;
		private var _fillColour:uint;
		
		public function OvalTool(){}
		
		public function mouseDown(x:Number, y:Number, fillColour:uint):void{
			_art= new Shape();
			_art.x = x;
			_art.y = y;
			_fillColour = fillColour
		}
		
		public function mouseMove(x:Number, y:Number):void{
			lineTempDraw(x,y)
		}
		
		private function lineTempDraw(x:Number,y:Number):void{
            _art.graphics.clear();
			_art.graphics.lineStyle(0.1,_fillColour, 1);
			_art.graphics.drawEllipse(0,0,x-_art.x,y-_art.y);
		}
		
		private function fillDraw(x:Number,y:Number):void{
            _art.graphics.clear();
			_art.graphics.beginFill(_fillColour,1);
			_art.graphics.drawEllipse(0,0,x-_art.x,y-_art.y);
		}
		
		public function mouseUp(x:Number, y:Number):void{
			fillDraw(x,y)
		}
		
		public function get art():DisplayObject{
			return _art;
		}
	}
}