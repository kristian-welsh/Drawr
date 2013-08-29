package unittests.toolbar {
	import asunit.framework.TestCase;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import flash.display.Sprite;
	
	import toolbar.Toolbar;
	import events.ToolbarEvent;
	
	public class ToolbarTest extends TestCase{
		
		private var _toolbar_instance:Toolbar;
		
		/**
		 * Constructor.
		 */
		public function ToolbarTest(testMethod:String):void {
			super(testMethod);
		}
		
		/**
		 * Creates a new toolbar button to test with.
		 */
		protected override function setUp():void {
			_toolbar_instance = new Toolbar(addButtons(new Sprite()));
		}
		
		private function addButtons(sprite:Sprite):Sprite {
			sprite.addChild(makeButton("rectangle_mc"));
			sprite.addChild(makeButton("brush_mc"));
			sprite.addChild(makeButton("oval_mc"));
			return sprite;
		}
		
		private function makeButton(name:String) {
			var clip:Sprite = new Sprite();
			clip.name = name;
			return clip;
		}

		/**
		 * Removes the test toolbar button.
		 */
		protected override function tearDown():void {
			_toolbar_instance = null;
		}
		
		/**
		 * Tests the class's initialisation.
		 */
		public function testInitialisation():void {
			assertTrue("test instance is a toolbar", _toolbar_instance is Toolbar);
		}
	}
}