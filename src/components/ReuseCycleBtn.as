package components 
{
	import services.Assets;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.text.TextFieldAutoSize;
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
			
			spinArrow = new Image(Assets.getTexture("lifeCycleBtn"));
			container.addChild(spinArrow);
			
			txtF = new TextField(spinArrow.width / 2, spinArrow.height / 2, "cykl\nzagospodarowania\nzużytego\nprzedmiotu", "GillSansMTFont", 18, 0xFFFFFF);
			txtF.pivotX = txtF.width / 2;
			txtF.pivotY = txtF.height / 2;
			txtF.color = 0x2e6519;
			txtF.vAlign = VAlign.CENTER;
			txtF.hAlign = HAlign.CENTER;
			txtF.x = spinArrow.x + spinArrow.width / 2;
			txtF.y = spinArrow.y + spinArrow.height / 2 + 10;
			container.addChild(txtF);
		}
		
	}
}