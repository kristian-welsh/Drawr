package unittests.canvas {
	import asunit.framework.TestCase;
	import canvas.Canvas;
	
	public class CanvasTest extends TestCase {
		private var _instance:Canvas;
		
		public function CanvasTest(testMethod:String):void {
			super(testMethod);
		}
		
		protected override function setUp():void {
			_instance = new Canvas();
		}
		
		public function testInitialisation():void {
			assertTrue("drawr is the right class type", _drawr_instance is Canvas);
		}
	}
}