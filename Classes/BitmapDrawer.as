package {
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.geom.Matrix;
	import flash.geom.Point;

	public class BitmapDrawer {
		private var _circleImage:Shape;
		private var _bitmapData:BitmapData;
		
		public function BitmapDrawer(bitmapData:BitmapData, circleImage:Shape) {
			_bitmapData = bitmapData;
			_circleImage = circleImage;
		}
		
		public function drawShape(position:Point, shape:Shape) {
			var m:Matrix = new Matrix;
			m.translate(position.x - 10, position.y - 10);
			_bitmapData.draw(shape, m);
		}
		
		public function get bitmapData():BitmapData {
			return _bitmapData;
		}
	}
}