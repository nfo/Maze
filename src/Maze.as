package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import starling.core.Starling;
	
	public class Maze extends Sprite
	{
		private var starling:Starling;

		public function Maze()
		{
			super();
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			// intialize Starling and launch the game loop
			starling = new Starling(Game, stage);
			starling.antiAliasing = 1;
			starling.start();

		}
	}
}