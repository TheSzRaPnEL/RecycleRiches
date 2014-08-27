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
	public class ReuseSystemBtn extends Sprite
	{
		private var container:Sprite;
		private var spinArrow:Image;
		private var txtF:TextField;
		
		public function ReuseSystemBtn()
		{
			container = new Sprite();
			addChild(container);
			
			spinArrow = new Image(Assets.getTexture("spinArrow"));
			container.addChild(spinArrow);
			
			txtF = new TextField(2 * spinArrow.width / 3, 2 * spinArrow.height / 3, "system odzysku\ni recyklingu\nna Mazowszu", "GillSansMTFont", 25, 0xFFFFFF);
			txtF.pivotX = txtF.width / 2;
			txtF.pivotY = txtF.height / 2;
			txtF.color = 0x2e6519;
			txtF.autoScale = true;
			txtF.vAlign = VAlign.CENTER;
			txtF.hAlign = HAlign.CENTER;
			txtF.x = spinArrow.x + spinArrow.width / 2;
			txtF.y = spinArrow.y + spinArrow.height / 2;
			container.addChild(txtF);
		}
		
	}
}