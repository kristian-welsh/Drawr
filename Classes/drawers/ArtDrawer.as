package drawers {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	public interface ArtDrawer {
		function createBrush(fillColor:uint):void;
		function drawShape(position:Point);
		function get art():Bitmap
	}
}