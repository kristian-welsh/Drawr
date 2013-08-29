package unittests.canvas{
	import asunit.framework.TestCase;
	import canvas.Canvas;
	
	public class CanvasTest extends TestCase {
		
		private var _canvasInstance:Canvas;
		
		/**
		 * Constructor.
		 */
		public function CanvasTest(testMethod:String):void {
			super(testMethod);
		}
		
		/**
		 * Set up an instance of Canvas to test with.
		 */
		protected override function setUp():void {
			_canvas_instance = new Canvas();
		}
		
		/**
		 * Delete testing instance.
		 */
		protected override function tearDown():void {
			_canvas_instance = null;
		}
		
		/**
		 * Test Initialisation.
		 */
		public function testInitialisation():void {
			assertTrue("drawr is the right class type",
					   _drawr_instance is Canvas);
		}
		
		/**
		 * Test Initialisation.
		 */
		public function testGetCurrentTool():void {
			
		}
		
		/**
		 * Test Initialisation.
		 */
		public function testSetCurrentTool():void{
			
		}
		
		/**
		 * Test Initialisation.
		 */
		public function testGetfillColour():uint{
			
		}
		
		public function testSetfillColour(value:uint):void{
			
		}
		
		/**
		 * Test Initialisation.
		 */
		private function testOnCanvasDown ():void {
			
		}
		
		/**
		 * Test Initialisation.
		 */
		private function testOnCanvasMove ():void {
			
		}
		
		/**
		 * Test Initialisation.
		 */
		private function testOnCanvasUp ():void {
		
		}
	}
}