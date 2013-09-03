package toolbar {
	import Classes.toolbar.IToolbar;
	import events.ToolbarEvent;
	import flash.display.*;
	import flash.events.*;
	
	/** @author Kristian Welsh */
	public class Toolbar extends EventDispatcher implements IToolbar {
		public function Toolbar(target:DisplayObjectContainer, container:DisplayObjectContainer):void {
			var rectangle:ToolbarButton = new ToolbarButton(target.getChildByName("rectangle_mc") as Sprite, ToolType.RECTANGLE);
			var oval:ToolbarButton = new ToolbarButton(target.getChildByName("oval_mc") as Sprite, ToolType.OVAL);
			var brush:ToolbarButton = new ToolbarButton(target.getChildByName("brush_mc") as Sprite, ToolType.BRUSH);
			var triangle:ToolbarButton = new ToolbarButton(target.getChildByName("triangle_mc") as Sprite, ToolType.TRIANGLE);
			
			rectangle.addEventListener(MouseEvent.CLICK, onToolClick);
			oval.addEventListener(MouseEvent.CLICK, onToolClick);
			brush.addEventListener(MouseEvent.CLICK, onToolClick);
			triangle.addEventListener(MouseEvent.CLICK, onToolClick);
			
			container.addChild(target);
			target.x = 12;
			target.y = 12;
		}
		
		private function onToolClick(event:MouseEvent):void {
			dispatchEvent(new ToolbarEvent(ToolbarEvent.SELECT, event.target.toolType));
		}
	}
}