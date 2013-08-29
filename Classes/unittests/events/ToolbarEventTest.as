package unittests.events {
	import asunit.framework.TestCase;
	import events.ToolbarEvent;
	
	public class ToolbarEventTest extends TestCase {
		
		private var _toolbarEventInstance1:ToolbarEvent;
		private var _toolbarEventInstance2:ToolbarEvent;
		private var _toolbarEventInstance3:ToolbarEvent;
		
		/**
		 * Constructor.
		 */
		public function ToolbarEventTest(testMethod:String):void {
			super(testMethod);
		}
		
		/**
		 * Set up an instance of ToolbarEvent to test with.
		 */
		protected override function setUp():void {
			_toolbarEventInstance1 = new ToolbarEvent(ToolbarEvent.SELECT, "tets");
			_toolbarEventInstance2 = new ToolbarEvent(ToolbarEvent.SELECT, "");
			_toolbarEventInstance3 = new ToolbarEvent("", "");
		}
		
		/**
		 * Delete testing instance.
		 */
		protected override function tearDown():void {
			_toolbarEventInstance1 = null;
			_toolbarEventInstance2 = null;
			_toolbarEventInstance3 = null;
		}
		
		/**
		 * test Initialisation by checking if it IS a ToolbarEvent.
		 */
		public function testInitialisation ():void {
			assertTrue("initialises as ToolbarEvent",_toolbarEventInstance1 is ToolbarEvent);
			assertTrue("initialises as ToolbarEvent",_toolbarEventInstance2 is ToolbarEvent);
			assertTrue("initialises as ToolbarEvent",_toolbarEventInstance3 is ToolbarEvent);
		}
		
		/**
		 * test the toString function works.
		 */
		public function testToString():void {
			assertEquals("normal instance toString() is the same as previously recorded value",
						'[ToolbarEvent type="select" toolType="tets"]',
						_toolbarEventInstance1.toString());
			assertEquals("empty tool string toString() is the same as previously recorded value",
						'[ToolbarEvent type="select" toolType=""]',
						_toolbarEventInstance2.toString());
			assertEquals("empty string type and toolType instance toString() is the same as previously recorded value",
						'[ToolbarEvent type="" toolType=""]',
						_toolbarEventInstance3.toString());
		}
		
		/**
		 * test the clone function works.
		 */
		public function testClone():void {
			assertEquals("normal instance's toSrting() is same as instance clone's toString()",
						_toolbarEventInstance1.toString(),
						_toolbarEventInstance1.clone().toString());
			assertEquals("empty tool instance's toSrting() is same as empty tool instance clone's toString()",
						_toolbarEventInstance2.toString(),
						_toolbarEventInstance2.clone().toString());
			assertEquals("empty type instance's toSrting() is same as empty type instance clone's toString()",
						_toolbarEventInstance3.toString(),
						_toolbarEventInstance3.clone().toString());
		}
		
		/**
		 * test the get tool type works.
		 */
		public function testGetType():void {
			assertEquals("initialises as ToolbarEvent",
						"tets",
						_toolbarEventInstance1.toolType);
			assertEquals("initialises as ToolbarEvent",
						"",
						_toolbarEventInstance2.toolType);
			assertEquals("initialises as ToolbarEvent",
						"",
						_toolbarEventInstance3.toolType);
		}
	}
}