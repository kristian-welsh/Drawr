package {
	import canvas.*;
	import events.ToolbarEvent;
	import fl.controls.ColorPicker;
	import flash.display.Sprite;
	import flash.events.Event;
	import toolbar.*;
	import toolcolourpicker.*;
	import tools.*;
	
	[SWF(width="800",height="600",frameRate="60",backgroundColor="#FFFFFF")]
	public class Drawr extends Sprite {
		private var _canvas:ICanvas;
		private var _toolbar:IToolbar;
		private var _colourPicker:ColorPicker;
		
		public function get canvas():ICanvas {
			return _canvas;
		}
		
		public function get toolbar():IToolbar {
			return _toolbar;
		}
		
		public function get picker():ColorPicker {
			return _colourPicker;
		}
		
		/**
		 * @param	parameters
		 * Contains options for the object's initialisation.
		 *   canvas:ICanvas the object to control the use of tools, defaults to a new Canvas.
		 *   toolbar:IToolbar the object to control the selection of tools, defaults to a new Toolbar.
		 *   colourPicker:ColorPicker the object to control the selection of colours, defaults to a new ToolColourPicker.
		 *   toolFactory:IToolFactory the factory to create new tools, defaults to ToolFactory.
		 */
		public function Drawr(parameters:Object = null):void {
			if (parameters == null)
				parameters = {};
			
			_canvas = parameters.canvas || new Canvas(new Canvas_mc(), this);
			_toolbar = parameters.toolbar || new Toolbar(new Toolbar_mc(), this);
			_colourPicker = parameters.colourPicker || new ToolColourPicker(this);
			
			_toolbar.addEventListener(ToolbarEvent.SELECT, onToolbarSelect);
			_colourPicker.addEventListener(Event.CHANGE, onFillColourChange);
		}
		
		private function onToolbarSelect(te:ToolbarEvent):void {
			_canvas.currentTool = ToolFactory.makeTool(te.toolType);
		}
		
		private function onFillColourChange(e:Event):void {
			_canvas.fillColour = _colourPicker.selectedColor;
		}
	}
}