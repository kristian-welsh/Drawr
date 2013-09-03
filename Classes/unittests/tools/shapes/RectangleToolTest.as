package unittests.tools.shapes {
	import tools.shapes.RectangleTool;
	
	public class RectangleToolTest extends ShapeToolTest {
		public function RectangleToolTest(testMethod:String):void {
			super(testMethod);
		}
		
		protected override function setUp():void {
			_instance = new RectangleTool();
		}
	}
}