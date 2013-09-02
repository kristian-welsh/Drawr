package toolcolourpicker {
	import fl.controls.ColorPicker;
	import flash.display.DisplayObjectContainer;
	
	/** @author Kristian Welsh */
	public class ToolColourPicker extends ColorPicker {
		public function ToolColourPicker(container:DisplayObjectContainer) {
			super();
			container.addChild(this);
			this.x = 17;
			this.y = 120;
		}
	}
}