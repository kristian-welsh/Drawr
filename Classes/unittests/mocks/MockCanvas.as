package unittests.mocks {
	import canvas.ICanvas;
	import tools.ITool;
	import tools.NullTool;
	
	/** @author Kristian Welsh */
	public class MockCanvas implements ICanvas {
		private var _currentToolAssignments:Vector.<ITool> = new Vector.<ITool>();
		private var _fillColourAssignments:Vector.<uint> = new Vector.<uint>();
		
		public function get currentTool():ITool {
			return NullTool.nullTool;
		}
		
		public function set currentTool(value:ITool):void {
			_currentToolAssignments.push(value);
		}
		
		public function get fillColour():uint {
			return 0;
		}
		
		public function set fillColour(value:uint):void {
			_fillColourAssignments.push(value);
		}
		
		public function get currentToolAssignments():Vector.<ITool> {
			return _currentToolAssignments;
		}
		
		public function get fillColourAssignments():Vector.<uint> {
			return _fillColourAssignments;
		}
		
	}

}