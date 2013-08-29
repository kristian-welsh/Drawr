package unittests.toolbar{
	import asunit.framework.TestCase;
	import toolbar.ToolType;
	
	public class ToolTypeTest extends TestCase{
		
		/**
		 * Constructor.
		 */
		public function ToolTypeTest(testMethod:String):void {
			super(testMethod);
		}
		
		/**
		 * Tests the class's public constants exist.
		 */
		public function testConsts():void {
			assertTrue("RECTANGLE exists", Boolean(ToolType["RECTANGLE"]));
			assertEquals("RECTANGLE is a string", typeof ToolType["RECTANGLE"] , "string");
			assertTrue("OVAL exists", Boolean(ToolType["OVAL"]));
			assertEquals("OVAL is a string", typeof ToolType["OVAL"] , "string");
			assertTrue("BRUSH exists", Boolean(ToolType["BRUSH"]));
			assertEquals("BRUSH is a string", typeof ToolType["BRUSH"] , "string");
		}
	}
}