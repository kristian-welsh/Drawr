package unittests.tools.shapes {
	import tools.shapes.OvalTool;
	
	public class OvalToolTest extends ShapeToolTest {
		public function OvalToolTest(testMethod:String):void {
			super(testMethod);
		}
		
		protected override function setUp():void {
			_instance =  new OvalTool();
		}
	}
}