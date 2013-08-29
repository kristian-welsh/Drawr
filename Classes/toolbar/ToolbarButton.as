package toolbar {
	import flash.events.EventDispatcher;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class ToolbarButton extends EventDispatcher{
		private var _target:Sprite;
		private var _toolType:String;
		public function ToolbarButton(target:Sprite, toolType:String):void {
			_target = target;
			_toolType = toolType;
			
			_target.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(me:MouseEvent):void {
			dispatchEvent(me);
		}
		
		public function get toolType():String{
			return _toolType;
		}
	}
}