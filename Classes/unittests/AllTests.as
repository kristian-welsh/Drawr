package unittests{
	import asunit.framework.TestSuite;
	import unittests.canvas.CanvasTest;
	import unittests.events.ToolbarEventTest;
	import unittests.tools.*;
	import unittests.toolbar.*;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.utils.getQualifiedClassName;
	
	public class AllTests extends TestSuite {
		public function AllTests() {
			//Drawr Tests
			addTest(new DrawrTest("testInitialisation"));
			addTest(new DrawrTest("testOnToolbarSelect"));
			addTest(new DrawrTest("testOnFillColourChange"));
			
			//Brush Tool Tests
			addTest(new BrushToolTest("testInitialisation"));
			addTest(new BrushToolTest("testMouseDown"));
			addTest(new BrushToolTest("testMouseMove"));
			addTest(new BrushToolTest("testMouseUp"));
			addTest(new BrushToolTest("testGetArt"));
			
			//Oval Tool Tests
			addTest(new OvalToolTest("testInitialisation"));
			addTest(new OvalToolTest("testMouseDown"));
			addTest(new OvalToolTest("testMouseMove"));
			addTest(new OvalToolTest("testMouseUp"));
			addTest(new OvalToolTest("testGetArt"));
			
			//Rectangle Tool Tests
			addTest(new RectangleToolTest("testInitialisation"));
			addTest(new RectangleToolTest("testMouseDown"));
			addTest(new RectangleToolTest("testMouseMove"));
			addTest(new RectangleToolTest("testMouseUp"));
			addTest(new RectangleToolTest("testGetArt"));
			
			//Toolbar Button Tests
			addTest(new ToolbarButtonTest("testInitialisation"));
			addTest(new ToolbarButtonTest("testGetToolType"));
			
			//ToolType data Tests
			addTest(new ToolTypeTest("testConsts"));
			
			//Toolbar Tests
			addTest(new ToolbarTest("testInitialisation"));
			
			//ToolbarEvent Tests
			addTest(new ToolbarEventTest("testInitialisation"));
			addTest(new ToolbarEventTest("testToString"));
			addTest(new ToolbarEventTest("testClone"));
			addTest(new ToolbarEventTest("testGetType"));
			
			//Canvas Tests
			addTest(new CanvasTest("testInitialisation"));
		}
	}
}