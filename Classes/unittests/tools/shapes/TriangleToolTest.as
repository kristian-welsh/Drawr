package unittests.tools.shapes {
	import tools.shapes.TriangleTool;
	
	public class TriangleToolTest extends ShapeToolTest {
		public function TriangleToolTest(testMethod:String):void {
			super(testMethod);
		}
		
		protected override function setUp():void {
			_instance = new TriangleTool();
		}
		
		public function foo():void {
			
		}
	}
}