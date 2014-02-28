package toolbar {
	import flash.events.*;
	
	public class ToolbarButton extends EventDispatcher {
		private var _target:EventDispatcher;
		private var _toolType:String;
		public function ToolbarButton(target:EventDispatcher, toolType:String):void {
			_target = target;
			_toolType = toolType;
			
			_target.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(me:MouseEvent):void {
			dispatchEvent(me);
		}
		
		public function get toolType():String {
			return _toolType;
		}
	}
}