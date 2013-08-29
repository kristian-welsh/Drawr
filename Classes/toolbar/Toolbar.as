package toolbar {
	import events.ToolbarEvent;
	import flash.display.*;
	import flash.events.*;
	
	/** @author Kristian Welsh */
	public class Toolbar extends EventDispatcher {
		public function Toolbar(target:DisplayObjectContainer, container:DisplayObjectContainer):void {
			var rect:ToolbarButton = new ToolbarButton(target.getChildByName("rectangle_mc") as Sprite, ToolType.RECTANGLE);
			var oval:ToolbarButton = new ToolbarButton(target.getChildByName("oval_mc") as Sprite, ToolType.OVAL);
			var brush:ToolbarButton = new ToolbarButton(target.getChildByName("brush_mc") as Sprite, ToolType.BRUSH);
			
			rect.addEventListener(MouseEvent.CLICK, onToolClick);
			oval.addEventListener(MouseEvent.CLICK, onToolClick);
			brush.addEventListener(MouseEvent.CLICK, onToolClick);
			
			container.addChild(target);
			target.x = 12;
			target.y = 12;
		}
		
		private function onToolClick(event:MouseEvent):void {
			dispatchEvent(new ToolbarEvent(ToolbarEvent.SELECT, event.target.toolType));
		}
	}
}