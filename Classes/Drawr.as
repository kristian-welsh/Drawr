package {
	import canvas.Canvas;
	import Classes.toolcolourpicker.ToolColourPicker;
	import events.ToolbarEvent;
	import fl.controls.ColorPicker;
	import flash.display.Sprite;
	import flash.events.Event;
	import toolbar.Toolbar;
	import toolbar.ToolType;
	import tools.*;
	
	[SWF(width="800",height="600",frameRate="60",backgroundColor="#FFFFFF")]
	public class Drawr extends Sprite {
		
		private var _canvas:Canvas;
		private var _toolbar:Toolbar;
		private var _colourPicker:ToolColourPicker;
		
		public function get canvas():Canvas {
			return _canvas;
		}
		
		public function get toolbar():Toolbar {
			return _toolbar;
		}
		
		public function get picker():ColorPicker {
			return _colourPicker;
		}
		
		public function Drawr():void {
			_toolbar = new Toolbar(new Toolbar_mc(), this);
			_canvas = new Canvas(new Canvas_mc(), this);
			_colourPicker = new ToolColourPicker(this);
			
			_toolbar.addEventListener(ToolbarEvent.SELECT, onToolbarSelect);
			_colourPicker.addEventListener(Event.CHANGE, onFillColourChange);
		}
		
		public function onToolbarSelect(te:ToolbarEvent):void {
			switch (te.toolType) {
				case ToolType.RECTANGLE:
					_canvas.currentTool = new RectangleTool();
					break;
				case ToolType.OVAL:
					_canvas.currentTool = new OvalTool();
					break;
				case ToolType.BRUSH:
					_canvas.currentTool = new BrushTool();
					break;
				default:
					_canvas.currentTool = null;
			}
		}
		
		public function onFillColourChange(e:Event):void {
			_canvas.fillColour = _colourPicker.selectedColor;
		}
	}
}