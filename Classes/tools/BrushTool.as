﻿package tools {
	import flash.display.*;
	import flash.geom.*;
	
	public class BrushTool implements ITool {
		private var _bitmapData:BitmapData;
		private var _art:Bitmap;
		private var _brushStroke:Shape;
		private var _curMousePos:Point;
		private var _lastMousePos:Point;
		
		public function BrushTool() {
			_bitmapData = new BitmapData(500, 500, true, 0x00000000);
			_art = new Bitmap(_bitmapData);
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
			updatePositionTrackers(x, y);
			drawArrayPoints(getInterpolatedLinePoints(_curMousePos, _lastMousePos))
		}
		
		private function drawArrayPoints(points:Array):void {
			for each(var point:Array in points)
				drawAt(point[0], point[1]);
		}
		
		private function drawAt(x:Number, y:Number):void {
			var m:Matrix = new Matrix;
			m.translate(x - 10, y - 10);
			_bitmapData.draw(_brushStroke, m);
		}
		
		private function getInterpolatedLinePoints(startPoint:Point, endPoint:Point):Array {
			var returnMe:Array = [];
			
			var xDif:Number = startPoint.x - endPoint.x;
			var yDif:Number = startPoint.y - endPoint.y;
			
			var xAbs:Number = Math.abs(xDif);
			var yAbs:Number = Math.abs(yDif);
			var pythagDist:Number = Math.sqrt(xAbs * xAbs + yAbs * yAbs);
			
			returnMe.push([startPoint.x, startPoint.y]);
			// TODO: refactor from brute force into an algorithm
			if (pythagDist > 1028) {
				returnMe.push([endPoint.x + xDif * 10 / 11, endPoint.y + yDif * 10 / 11]);
				returnMe.push([endPoint.x + xDif * 9 / 11, endPoint.y + yDif * 9 / 11]);
				returnMe.push([endPoint.x + xDif * 8 / 11, endPoint.y + yDif * 8 / 11]);
				returnMe.push([endPoint.x + xDif * 7 / 11, endPoint.y + yDif * 7 / 11]);
				returnMe.push([endPoint.x + xDif * 6 / 11, endPoint.y + yDif * 6 / 11]);
				returnMe.push([endPoint.x + xDif * 5 / 11, endPoint.y + yDif * 5 / 11]);
				returnMe.push([endPoint.x + xDif * 4 / 11, endPoint.y + yDif * 4 / 11]);
				returnMe.push([endPoint.x + xDif * 3 / 11, endPoint.y + yDif * 3 / 11]);
				returnMe.push([endPoint.x + xDif * 2 / 11, endPoint.y + yDif * 2 / 11]);
				returnMe.push([endPoint.x + xDif * 1 / 11, endPoint.y + yDif * 1 / 11]);
			} else if (pythagDist > 516) {
				returnMe.push([endPoint.x + xDif * 9 / 10, endPoint.y + yDif * 9 / 10]);
				returnMe.push([endPoint.x + xDif * 8 / 10, endPoint.y + yDif * 8 / 10]);
				returnMe.push([endPoint.x + xDif * 7 / 10, endPoint.y + yDif * 7 / 10]);
				returnMe.push([endPoint.x + xDif * 6 / 10, endPoint.y + yDif * 6 / 10]);
				returnMe.push([endPoint.x + xDif * 5 / 10, endPoint.y + yDif * 5 / 10]);
				returnMe.push([endPoint.x + xDif * 4 / 10, endPoint.y + yDif * 4 / 10]);
				returnMe.push([endPoint.x + xDif * 3 / 10, endPoint.y + yDif * 3 / 10]);
				returnMe.push([endPoint.x + xDif * 2 / 10, endPoint.y + yDif * 2 / 10]);
				returnMe.push([endPoint.x + xDif * 1 / 10, endPoint.y + yDif * 1 / 10]);
			} else if (pythagDist > 260) {
				returnMe.push([endPoint.x + xDif * 8 / 9, endPoint.y + yDif * 8 / 9]);
				returnMe.push([endPoint.x + xDif * 7 / 9, endPoint.y + yDif * 7 / 9]);
				returnMe.push([endPoint.x + xDif * 6 / 9, endPoint.y + yDif * 6 / 9]);
				returnMe.push([endPoint.x + xDif * 5 / 9, endPoint.y + yDif * 5 / 9]);
				returnMe.push([endPoint.x + xDif * 4 / 9, endPoint.y + yDif * 4 / 9]);
				returnMe.push([endPoint.x + xDif * 3 / 9, endPoint.y + yDif * 3 / 9]);
				returnMe.push([endPoint.x + xDif * 2 / 9, endPoint.y + yDif * 2 / 9]);
				returnMe.push([endPoint.x + xDif * 1 / 9, endPoint.y + yDif * 1 / 9]);
			} else if (pythagDist > 132) {
				returnMe.push([endPoint.x + xDif * 7 / 8, endPoint.y + yDif * 7 / 8]);
				returnMe.push([endPoint.x + xDif * 6 / 8, endPoint.y + yDif * 6 / 8]);
				returnMe.push([endPoint.x + xDif * 5 / 8, endPoint.y + yDif * 5 / 8]);
				returnMe.push([endPoint.x + xDif * 4 / 8, endPoint.y + yDif * 4 / 8]);
				returnMe.push([endPoint.x + xDif * 3 / 8, endPoint.y + yDif * 3 / 8]);
				returnMe.push([endPoint.x + xDif * 2 / 8, endPoint.y + yDif * 2 / 8]);
				returnMe.push([endPoint.x + xDif * 1 / 8, endPoint.y + yDif * 1 / 8]);
			} else if (pythagDist > 68) {
				returnMe.push([endPoint.x + xDif * 6 / 7, endPoint.y + yDif * 6 / 7]);
				returnMe.push([endPoint.x + xDif * 5 / 7, endPoint.y + yDif * 5 / 7]);
				returnMe.push([endPoint.x + xDif * 4 / 7, endPoint.y + yDif * 4 / 7]);
				returnMe.push([endPoint.x + xDif * 3 / 7, endPoint.y + yDif * 3 / 7]);
				returnMe.push([endPoint.x + xDif * 2 / 7, endPoint.y + yDif * 2 / 7]);
				returnMe.push([endPoint.x + xDif * 1 / 7, endPoint.y + yDif * 1 / 7]);
			} else if (pythagDist > 36) {
				returnMe.push([endPoint.x + xDif * 5 / 6, endPoint.y + yDif * 5 / 6]);
				returnMe.push([endPoint.x + xDif * 4 / 6, endPoint.y + yDif * 4 / 6]);
				returnMe.push([endPoint.x + xDif * 3 / 6, endPoint.y + yDif * 3 / 6]);
				returnMe.push([endPoint.x + xDif * 2 / 6, endPoint.y + yDif * 2 / 6]);
				returnMe.push([endPoint.x + xDif * 1 / 6, endPoint.y + yDif * 1 / 6]);
			} else if (pythagDist > 20) {
				returnMe.push([endPoint.x + xDif * 4 / 5, endPoint.y + yDif * 4 / 5]);
				returnMe.push([endPoint.x + xDif * 3 / 5, endPoint.y + yDif * 3 / 5]);
				returnMe.push([endPoint.x + xDif * 2 / 5, endPoint.y + yDif * 2 / 5]);
				returnMe.push([endPoint.x + xDif * 1 / 5, endPoint.y + yDif * 1 / 5]);
			} else if (pythagDist > 12) {
				returnMe.push([endPoint.x + xDif * 3 / 4, endPoint.y + yDif * 3 / 4]);
				returnMe.push([endPoint.x + xDif * 2 / 4, endPoint.y + yDif * 2 / 4]);
				returnMe.push([endPoint.x + xDif * 1 / 4, endPoint.y + yDif * 1 / 4]);
			} else if (pythagDist > 8) {
				returnMe.push([endPoint.x + xDif * 2 / 3, endPoint.y + yDif * 2 / 3]);
				returnMe.push([endPoint.x + xDif * 1 / 3, endPoint.y + yDif * 1 / 3]);
			} else if (pythagDist > 6) {
				returnMe.push([endPoint.x + xDif * 1 / 2, endPoint.y + yDif * 1 / 2]);
			}
			return returnMe;
		}
		
		private function updatePositionTrackers(x:Number, y:Number):void {
			_lastMousePos = _curMousePos;
			_curMousePos = new Point(x, y);
		}
		
		public function mouseUp(x:Number, y:Number):void {
			
		}
		
		public function get art():DisplayObject {
			return _art;
		}
	}
}