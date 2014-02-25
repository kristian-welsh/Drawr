package drawers {
	import flash.display.*;
	import flash.geom.*;

	public class BitmapDrawer implements ArtDrawer {
		private var _bitmapData:BitmapData;
		private var _art:Bitmap;
		private var _circleImage:Shape;
		
		public function BitmapDrawer() {
			_bitmapData = new BitmapData(500, 500, true, 0x00000000);
			_art = new Bitmap(_bitmapData);
		}
		
		public function createBrush(fillColor:uint):void {
			_circleImage = new Shape();
			var gradBox:Matrix = new Matrix();
			gradBox.createGradientBox(20, 20, 0, 0, 0);
			_circleImage.graphics.beginGradientFill(GradientType.RADIAL, [fillColor, fillColor], [1, 0], [127, 255], gradBox);
			_circleImage.graphics.drawCircle(10, 10, 10);
		}
		
		public function drawShape(position:Point) {
			var m:Matrix = new Matrix;
			m.translate(position.x - 10, position.y - 10);
			_bitmapData.draw(_circleImage, m);
		}
		
		public function get art():Bitmap {
			return _art;
		}
	}
}