package{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import fl.controls.ColorPicker;
	
	import canvas.Canvas;
	import toolbar.Toolbar;
	
	import flash.events.Event
	import events.ToolbarEvent;
	import toolbar.ToolType;
	import tools.*;
	
	
	public class Drawr extends Sprite{
		
		private var _canvas:Canvas;
		private var _toolbar:Toolbar;
		private var _picker:ColorPicker;
		
		public function get canvas():Canvas {
			return _canvas;
		}
		
		public function get toolbar():Toolbar {
			return _toolbar;
		}
		
		public function get picker():ColorPicker {
			return _picker;
		}
		
		public function Drawr():void {
			var toolbar_sprite:Toolbar_mc = new Toolbar_mc();
			var canvas_sprite:Canvas_mc = new Canvas_mc();
			
			_toolbar = new Toolbar(toolbar_sprite);
			_canvas = new Canvas(canvas_sprite);
			_picker = new ColorPicker();
			
			addChild(toolbar_sprite);
			addChild(canvas_sprite);
			addChild(_picker);
			
			toolbar_sprite.x = 12;
			toolbar_sprite.y = 12;
			canvas_sprite.x = 55;
			canvas_sprite.y = 10;
			_picker.x = 17;
			_picker.y = 120;
			
			_toolbar.addEventListener(ToolbarEvent.SELECT,onToolbarSelect);
			_picker.addEventListener(Event.CHANGE,onFillColourChange);
		}
        public function onToolbarSelect(te:ToolbarEvent):void {
			switch(te.toolType){
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
		
		public function onFillColourChange(e:Event):void{
			_canvas.fillColour = _picker.selectedColor;
		}
	}
}