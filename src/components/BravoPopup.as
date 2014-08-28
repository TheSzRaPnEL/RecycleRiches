package components
{
	import services.Assets;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class BravoPopup extends Sprite
	{
		private var txtF:TextField;
		private var image:Image;
		private var container:Sprite;
		
		public function BravoPopup()
		{
			container = new Sprite();
			addChild(container);
			
			image = new Image(Assets.getTexture("popup_Brawo"));
			container.addChild(image);
			
			txtF = new TextField(2 * image.width / 3, image.height / 4, "", "GillSansMTFont", 30, 0, true);
			txtF.touchable = false;
			txtF.autoScale = true;
			txtF.vAlign = VAlign.CENTER;
			txtF.hAlign = HAlign.CENTER;
			container.addChild(txtF);
			txtF.x = image.width / 6;
			txtF.y = 2 * image.height / 3;
		}
		
		public function set text(value:String):void
		{
			txtF.text = value;
		}
		
		public function set imageTexture(texture:Texture):void
		{
			image.texture = texture;
			image.width = texture.width;
			image.height = texture.height;
		}
		
	}
}