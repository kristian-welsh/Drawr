package unittests.toolbar {
	import asunit.framework.TestCase;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import toolbar.ToolbarButton;
	
	/** @author Kristian Welsh */
	public class ToolbarButtonTest extends TestCase {
		private var _mouseEventRecord:Vector.<MouseEvent> = new Vector.<MouseEvent>();
		
		public function ToolbarButtonTest(testMethod:String):void {
			super(testMethod);
		}
		
		public function should_repeat_click_events_from_target():void {
			var target:EventDispatcher = new Sprite();
			var instance:ToolbarButton = new ToolbarButton(target, "test");
			instance.addEventListener(MouseEvent.CLICK, recordClickEvent);
			target.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
			assertEquals(1, _mouseEventRecord.length);
		}
		
		private function recordClickEvent(event:MouseEvent):void {
			_mouseEventRecord.push(event);
		}
	}
}