package unittests.toolcolourpicker {
	import asunit.framework.TestCase;
	import flash.display.Sprite;
	import toolcolourpicker.ToolColourPicker;
	
	/** @author Kristian Welsh */
	public class ToolColourPickerTest extends TestCase {
		private var _instance:ToolColourPicker;
		private var _container:Sprite;
		
		public function ToolColourPickerTest(testMethod:String):void {
			super(testMethod);
		}
		
		protected override function setUp():void {
			_container = new Sprite();
			_instance = new ToolColourPicker(_container);
		}
		
		public function should_add_self_as_a_child_of_container_on_initialization():void {
			assertEquals(0, _container.getChildIndex(_instance));
		}
	}
}