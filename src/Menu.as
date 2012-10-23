package
{
	import feathers.controls.Button;
	import feathers.text.BitmapFontTextFormat;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.text.BitmapFont;
	import feathers.controls.Button;
	
	public class Menu extends Sprite
	{
		[Embed(source="/../assets/images/atlas.xml",mimeType="application/octet-stream")]
		public static const ATLAS_XML:Class;
		
		[Embed(source="/../assets/images/atlas.png")]
		public static const ATLAS_IMAGE:Class;
		
		[Embed(source="/../assets/images/tahoma30.fnt",mimeType="application/octet-stream")]
		public static const FONT_XML:Class;
		
		public function Menu()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		/**
		 * The Feathers Button control that we'll be creating.
		 */
		protected var button:Button;
		
		/**
		 * The texture atlas that contains the button's skins.
		 */
		protected var atlas:TextureAtlas;
		
		/**
		 * The bitmap font used to display the button's text.
		 */
		protected var font:BitmapFont;
		
		/**
		 * The index used to pick a label from the LABELS defined above.
		 */
		protected var labelIndex:int = 0;
		
		/**
		 * When the button is clicked, it's label changes.
		 */
		protected static const LABELS:Vector.<String> = new <String>
			[
				"Hi. I'm Feathers!",
				"Have a nice day."
			];
		
		private function onAddedToStage(event:Event):void
		{
			this.atlas = new TextureAtlas( Texture.fromBitmap( new ATLAS_IMAGE(), false ), XML( new ATLAS_XML() ) );
			this.font = new BitmapFont( this.atlas.getTexture( "tahoma30_0" ), XML( new FONT_XML() ) );
			
			this.button = new Button();
			this.button.label = "Click Me";
			
			//if no skin is defined for a specific state, the button will use
			//the default skin. it's usually smart to use the up skin as the
			//default. can be any Starling display object.
			this.button.defaultSkin = new Image(this.atlas.getTexture("button-up-skin"));
			
			//here's a specific skin for the down state
			this.button.downSkin = new Image(this.atlas.getTexture("button-down-skin"));
			
			//the button's defaultLabelProperties works similarly to the
			//defaultSkin. Any of the text renderer's properties may be set,
			//but we'll only set the textFormat.
			//The default text renderer is BitmapFontTextRenderer, so we pass in
			//a BitmapFontTextFormat object.
			this.button.defaultLabelProperties.textFormat = new BitmapFontTextFormat(this.font, 30, 0x000000);
			
			//an event that tells us when the user has tapped/clicked the button
			this.button.addEventListener(Event.TRIGGERED, button_triggeredHandler);
			
			//add it to the display list just like any other display object
			this.addChild(this.button);
			
			//the button will validate on its own before the next render, but
			//we want to position it immediately. tell it to validate now.
			this.button.validate();
			this.button.x = (this.stage.stageWidth - this.button.width) / 2;
			this.button.y = (this.stage.stageHeight - this.button.height) / 2;
			
			trace("Game initialized");
		}
		
		/**
		 * Listener for the Button's Event.TRIGGERED event.
		 */
		protected function button_triggeredHandler(event:Event):void
		{
			//the button's label is rotated among the values defined above
			this.button.label = LABELS[this.labelIndex];
			this.labelIndex++;
			if(this.labelIndex >= LABELS.length)
			{
				this.labelIndex = 0;
			}
		}
		
	}
}