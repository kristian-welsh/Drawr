package tools {
	import flash.display.*;
	import flash.geom.*;
	
	public class BrushTool implements ITool {
		
		private var _bitmap:Bitmap;
		private var _bmd:BitmapData;
		private var _brushStroke:Shape;
		private var _curMousePos:Point;
		private var _lastMousePos:Point;
		
		public function BrushTool() {
			_bmd = new BitmapData(500, 500, true, 0x00000000);
			_bitmap = new Bitmap(_bmd);
		}
		
		public function mouseDown(x:Number, y:Number, fillColor:uint):void {
			createBrush(fillColor);
			drawAt(x, y);
			_curMousePos = new Point(x, y);
			_lastMousePos = new Point(x, y);
		}
		
		private function createBrush(fillColor:uint):void {
			_brushStroke = new Shape();
			var gradBox:Matrix = new Matrix();
			gradBox.createGradientBox(20, 20, 0, 0, 0);
			_brushStroke.graphics.beginGradientFill(GradientType.RADIAL, [fillColor, fillColor], [1, 0], [127, 255], gradBox);
			_brushStroke.graphics.drawCircle(10, 10, 10);
		}
		
		public function mouseMove(x:Number, y:Number):void {
			drawAt(x, y);
			
			_lastMousePos = _curMousePos;
			_curMousePos = new Point(x, y);
			
			var xDif:Number = _curMousePos.x - _lastMousePos.x;
			var yDif:Number = _curMousePos.y - _lastMousePos.y;
			
			var xAbs:Number = Math.abs(xDif);
			var yAbs:Number = Math.abs(yDif);
			var pythagDist:Number = Math.sqrt(xAbs * xAbs + yAbs * yAbs);
			var drawingBuffer:Array = [];
			
			// TODO: refactor from brute force into an algorithm
			if (pythagDist > 1028) {
				drawingBuffer.push([_lastMousePos.x + xDif * 10 / 11, _lastMousePos.y + yDif * 10 / 11]);
				drawingBuffer.push([_lastMousePos.x + xDif * 9 / 11, _lastMousePos.y + yDif * 9 / 11]);
				drawingBuffer.push([_lastMousePos.x + xDif * 8 / 11, _lastMousePos.y + yDif * 8 / 11]);
				drawingBuffer.push([_lastMousePos.x + xDif * 7 / 11, _lastMousePos.y + yDif * 7 / 11]);
				drawingBuffer.push([_lastMousePos.x + xDif * 6 / 11, _lastMousePos.y + yDif * 6 / 11]);
				drawingBuffer.push([_lastMousePos.x + xDif * 5 / 11, _lastMousePos.y + yDif * 5 / 11]);
				drawingBuffer.push([_lastMousePos.x + xDif * 4 / 11, _lastMousePos.y + yDif * 4 / 11]);
				drawingBuffer.push([_lastMousePos.x + xDif * 3 / 11, _lastMousePos.y + yDif * 3 / 11]);
				drawingBuffer.push([_lastMousePos.x + xDif * 2 / 11, _lastMousePos.y + yDif * 2 / 11]);
				drawingBuffer.push([_lastMousePos.x + xDif * 1 / 11, _lastMousePos.y + yDif * 1 / 11]);
			} else if (pythagDist > 516) {
				drawingBuffer.push([_lastMousePos.x + xDif * 9 / 10, _lastMousePos.y + yDif * 9 / 10]);
				drawingBuffer.push([_lastMousePos.x + xDif * 8 / 10, _lastMousePos.y + yDif * 8 / 10]);
				drawingBuffer.push([_lastMousePos.x + xDif * 7 / 10, _lastMousePos.y + yDif * 7 / 10]);
				drawingBuffer.push([_lastMousePos.x + xDif * 6 / 10, _lastMousePos.y + yDif * 6 / 10]);
				drawingBuffer.push([_lastMousePos.x + xDif * 5 / 10, _lastMousePos.y + yDif * 5 / 10]);
				drawingBuffer.push([_lastMousePos.x + xDif * 4 / 10, _lastMousePos.y + yDif * 4 / 10]);
				drawingBuffer.push([_lastMousePos.x + xDif * 3 / 10, _lastMousePos.y + yDif * 3 / 10]);
				drawingBuffer.push([_lastMousePos.x + xDif * 2 / 10, _lastMousePos.y + yDif * 2 / 10]);
				drawingBuffer.push([_lastMousePos.x + xDif * 1 / 10, _lastMousePos.y + yDif * 1 / 10]);
			} else if (pythagDist > 260) {
				drawingBuffer.push([_lastMousePos.x + xDif * 8 / 9, _lastMousePos.y + yDif * 8 / 9]);
				drawingBuffer.push([_lastMousePos.x + xDif * 7 / 9, _lastMousePos.y + yDif * 7 / 9]);
				drawingBuffer.push([_lastMousePos.x + xDif * 6 / 9, _lastMousePos.y + yDif * 6 / 9]);
				drawingBuffer.push([_lastMousePos.x + xDif * 5 / 9, _lastMousePos.y + yDif * 5 / 9]);
				drawingBuffer.push([_lastMousePos.x + xDif * 4 / 9, _lastMousePos.y + yDif * 4 / 9]);
				drawingBuffer.push([_lastMousePos.x + xDif * 3 / 9, _lastMousePos.y + yDif * 3 / 9]);
				drawingBuffer.push([_lastMousePos.x + xDif * 2 / 9, _lastMousePos.y + yDif * 2 / 9]);
				drawingBuffer.push([_lastMousePos.x + xDif * 1 / 9, _lastMousePos.y + yDif * 1 / 9]);
			} else if (pythagDist > 132) {
				drawingBuffer.push([_lastMousePos.x + xDif * 7 / 8, _lastMousePos.y + yDif * 7 / 8]);
				drawingBuffer.push([_lastMousePos.x + xDif * 6 / 8, _lastMousePos.y + yDif * 6 / 8]);
				drawingBuffer.push([_lastMousePos.x + xDif * 5 / 8, _lastMousePos.y + yDif * 5 / 8]);
				drawingBuffer.push([_lastMousePos.x + xDif * 4 / 8, _lastMousePos.y + yDif * 4 / 8]);
				drawingBuffer.push([_lastMousePos.x + xDif * 3 / 8, _lastMousePos.y + yDif * 3 / 8]);
				drawingBuffer.push([_lastMousePos.x + xDif * 2 / 8, _lastMousePos.y + yDif * 2 / 8]);
				drawingBuffer.push([_lastMousePos.x + xDif * 1 / 8, _lastMousePos.y + yDif * 1 / 8]);
			} else if (pythagDist > 68) {
				drawingBuffer.push([_lastMousePos.x + xDif * 6 / 7, _lastMousePos.y + yDif * 6 / 7]);
				drawingBuffer.push([_lastMousePos.x + xDif * 5 / 7, _lastMousePos.y + yDif * 5 / 7]);
				drawingBuffer.push([_lastMousePos.x + xDif * 4 / 7, _lastMousePos.y + yDif * 4 / 7]);
				drawingBuffer.push([_lastMousePos.x + xDif * 3 / 7, _lastMousePos.y + yDif * 3 / 7]);
				drawingBuffer.push([_lastMousePos.x + xDif * 2 / 7, _lastMousePos.y + yDif * 2 / 7]);
				drawingBuffer.push([_lastMousePos.x + xDif * 1 / 7, _lastMousePos.y + yDif * 1 / 7]);
			} else if (pythagDist > 36) {
				drawingBuffer.push([_lastMousePos.x + xDif * 5 / 6, _lastMousePos.y + yDif * 5 / 6]);
				drawingBuffer.push([_lastMousePos.x + xDif * 4 / 6, _lastMousePos.y + yDif * 4 / 6]);
				drawingBuffer.push([_lastMousePos.x + xDif * 3 / 6, _lastMousePos.y + yDif * 3 / 6]);
				drawingBuffer.push([_lastMousePos.x + xDif * 2 / 6, _lastMousePos.y + yDif * 2 / 6]);
				drawingBuffer.push([_lastMousePos.x + xDif * 1 / 6, _lastMousePos.y + yDif * 1 / 6]);
			} else if (pythagDist > 20) {
				drawingBuffer.push([_lastMousePos.x + xDif * 4 / 5, _lastMousePos.y + yDif * 4 / 5]);
				drawingBuffer.push([_lastMousePos.x + xDif * 3 / 5, _lastMousePos.y + yDif * 3 / 5]);
				drawingBuffer.push([_lastMousePos.x + xDif * 2 / 5, _lastMousePos.y + yDif * 2 / 5]);
				drawingBuffer.push([_lastMousePos.x + xDif * 1 / 5, _lastMousePos.y + yDif * 1 / 5]);
			} else if (pythagDist > 12) {
				drawingBuffer.push([_lastMousePos.x + xDif * 3 / 4, _lastMousePos.y + yDif * 3 / 4]);
				drawingBuffer.push([_lastMousePos.x + xDif * 2 / 4, _lastMousePos.y + yDif * 2 / 4]);
				drawingBuffer.push([_lastMousePos.x + xDif * 1 / 4, _lastMousePos.y + yDif * 1 / 4]);
			} else if (pythagDist > 8) {
				drawingBuffer.push([_lastMousePos.x + xDif * 2 / 3, _lastMousePos.y + yDif * 2 / 3]);
				drawingBuffer.push([_lastMousePos.x + xDif * 1 / 3, _lastMousePos.y + yDif * 1 / 3]);
			} else if (pythagDist > 6) {
				drawingBuffer.push([_lastMousePos.x + xDif * 1 / 2, _lastMousePos.y + yDif * 1 / 2]);
			}
			for (var i:uint = 0; i < drawingBuffer.length; i++) {
				drawAt(drawingBuffer[i][0], drawingBuffer[i][1]);
			}
		}
		
		private function drawAt(x:Number, y:Number):void {
			var m:Matrix = new Matrix;
			m.translate(x - 10, y - 10);
			_bmd.draw(_brushStroke, m);
		}
		
		public function mouseUp(x:Number, y:Number):void {
		
		}
		
		public function get art():DisplayObject {
			return _bitmap;
		}
	}
}