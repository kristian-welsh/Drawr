package unittests.toolbar{
	import flash.display.Sprite;
	import asunit.framework.TestCase;
	import toolbar.ToolbarButton;
	import toolbar.ToolType;
	
	public class ToolbarButtonTest extends TestCase{
		
		private var _toolbar_button_instance_1:ToolbarButton;
		private var _toolbar_button_instance_2:ToolbarButton;
		private var _toolbar_button_instance_3:ToolbarButton;
		
		/**
		 * Constructor.
		 */
		public function ToolbarButtonTest(testMethod:String):void {
			super(testMethod);
		}
		
		/**
		 * Creates a new toolbar button to test with.
		 */
		protected override function setUp():void {
			_toolbar_button_instance_1 = new ToolbarButton(new Sprite(), ToolType.RECTANGLE);
			_toolbar_button_instance_2 = new ToolbarButton(new Sprite(), ToolType.OVAL);
			_toolbar_button_instance_3 = new ToolbarButton(new Sprite(), ToolType.BRUSH);
		}
		
		/**
		 * Removes the test toolbar button.
		 */
		protected override function tearDown():void {
			_toolbar_button_instance_1 = null;
			_toolbar_button_instance_2 = null;
			_toolbar_button_instance_3 = null;
		}
		
		/**
		 * Tests the class's initialisation.
		 */
		public function testInitialisation():void {
			assertTrue("test instance 1 is a toolbar button",_toolbar_button_instance_1 is ToolbarButton);
			assertTrue("test instance 2 is a toolbar button",_toolbar_button_instance_2 is ToolbarButton);
			assertTrue("test instance 3 is a toolbar button",_toolbar_button_instance_3 is ToolbarButton);
		}
		
		/**
		 * Tests the class's getter for toolType
		 */
		public function testGetToolType():void{
			var valid1:Boolean = Boolean(ToolType[_toolbar_button_instance_1.toolType.toUpperCase()]);
			var valid2:Boolean = Boolean(ToolType[_toolbar_button_instance_2.toolType.toUpperCase()]);
			var valid3:Boolean = Boolean(ToolType[_toolbar_button_instance_3.toolType.toUpperCase()]);
			assertTrue("getToolType on instance 1 returns a valid toolType const string", valid1);
			assertTrue("getToolType on instance 2 returns a valid toolType const string", valid2);
			assertTrue("getToolType on instance 3 returns a valid toolType const string", valid3);
		}
	}
}