package components
{
	import services.Assets;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class MapPopup extends Sprite
	{
		private var container:Sprite;
		private var background:Image;
		private var txtF:TextField;
		
		public function MapPopup()
		{
			container = new Sprite();
			addChild(container);
			
			background = new Image(Assets.getTexture("popup_Mapa"));
			container.addChild(background);
			
			txtF = new TextField(100, 50, "", "Arial", 20, 0, true);
			txtF.autoScale = true;
			txtF.vAlign = VAlign.CENTER;
			txtF.hAlign = HAlign.CENTER;
			txtF.x = 40;
			txtF.y = 25;
			container.addChild(txtF);
			
			container.x = 20;
			container.y = -40;
		}
		
		public function set text(value:String):void
		{
			txtF.text = value;
		}
	
	}

}