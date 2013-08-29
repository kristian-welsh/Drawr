package events {
	import flash.events.Event;
	
	public class ToolbarEvent extends Event {
		
		public static const SELECT:String = "select";
		
		private var _toolType:String;
		
		public function ToolbarEvent(type:String, toolType:String, bubbles:Boolean = false, cancelable:Boolean = false):void {
			_toolType = toolType;
			super(type, bubbles, cancelable);
		}
		
		public override function toString():String {
			return formatToString("ToolbarEvent", "type", "toolType");
		}
		
		public override function clone():Event {
			return new ToolbarEvent(type, toolType, bubbles, cancelable);
		}
		
		public function get toolType():String {
			return _toolType;
		}
	
	}
}