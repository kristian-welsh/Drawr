package canvas {
	import tools.ITool;
	
	public interface ICanvas {
		function get currentTool():ITool;
		function set currentTool(value:ITool):void;
		function get fillColour():uint;
		function set fillColour(value:uint):void;
	}
}