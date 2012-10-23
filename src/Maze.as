package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import starling.core.Starling;
	
	[SWF(frameRate="60", width="1024", height="768", backgroundColor="0x000000")]
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
			starling = new Starling(Menu, stage);
			starling.antiAliasing = 1;
			starling.start();

		}
	}
}