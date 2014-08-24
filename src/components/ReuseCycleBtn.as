package components 
{
	import services.Assets;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.utils.Color;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class ReuseCycleBtn extends Sprite
	{
		private var container:Sprite;
		private var spinArrow:Image;
		private var colorCircle:ColorCircle;
		private var txtF:TextField;
		
		public function ReuseCycleBtn() 
		{
			container = new Sprite();
			addChild(container);
			
			spinArrow = new Image(Assets.getTexture("spinArrow"));
			container.addChild(spinArrow);
			
			colorCircle = new ColorCircle();
			colorCircle.scaleX = 0.8;
			colorCircle.scaleY = colorCircle.scaleX;
			colorCircle.color = Color.GREEN;
			colorCircle.x = -40;
			colorCircle.y = 40;
			container.addChild(colorCircle);
			
			colorCircle = new ColorCircle();
			colorCircle.scaleX = 0.8;
			colorCircle.scaleY = colorCircle.scaleX;
			colorCircle.color = Color.GREEN;
			colorCircle.x = 100;
			colorCircle.y = -50;
			container.addChild(colorCircle);
			
			colorCircle = new ColorCircle();
			colorCircle.scaleX = 0.8;
			colorCircle.scaleY = colorCircle.scaleX;
			colorCircle.color = Color.GREEN;
			colorCircle.x = 230;
			colorCircle.y = 40;
			container.addChild(colorCircle);
			
			colorCircle = new ColorCircle();
			colorCircle.scaleX = 0.8;
			colorCircle.scaleY = colorCircle.scaleX;
			colorCircle.color = Color.GREEN;
			colorCircle.x = 205;
			colorCircle.y = 190;
			container.addChild(colorCircle);
			
			colorCircle = new ColorCircle();
			colorCircle.scaleX = 0.8;
			colorCircle.scaleY = colorCircle.scaleX;
			colorCircle.color = Color.GREEN;
			colorCircle.x = -15;
			colorCircle.y = 190;
			container.addChild(colorCircle);
			
			txtF = new TextField(2 * spinArrow.width / 3, 2 * spinArrow.height / 3, "cykl\nzagospodarowania\nZUZYTEGO\nPRZEDMIOTU", "KarnivatFont", 70, 0xFFFFFF);
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