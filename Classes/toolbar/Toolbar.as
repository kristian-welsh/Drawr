package toolbar {
	import events.ToolbarEvent;
	import flash.display.*;
	import flash.events.*;
	
	public class Toolbar extends EventDispatcher {
		private var _target:Sprite;
		public function Toolbar(target:Sprite):void {
			_target = target;
			var rect:ToolbarButton = new ToolbarButton(_target.getChildByName("rectangle_mc") as Sprite, ToolType.RECTANGLE);
			var oval:ToolbarButton = new ToolbarButton(_target.getChildByName("oval_mc") as Sprite, ToolType.OVAL);
			var brush:ToolbarButton = new ToolbarButton(_target.getChildByName("brush_mc") as Sprite, ToolType.BRUSH);
			
			rect.addEventListener(MouseEvent.CLICK, onToolClick);
			oval.addEventListener(MouseEvent.CLICK, onToolClick);
			brush.addEventListener(MouseEvent.CLICK, onToolClick);
		}
		
		private function onToolClick(me:MouseEvent):void {
			dispatchEvent(new ToolbarEvent(ToolbarEvent.SELECT, me.target.toolType));
		}
	}
}