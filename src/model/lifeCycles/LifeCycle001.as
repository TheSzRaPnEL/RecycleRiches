package model.lifeCycles 
{
	import components.ColorCircle;
	import model.LifeCycle;
	import starling.text.TextField;
	import starling.utils.Color;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class LifeCycle001 extends LifeCycle
	{
		private var txtF:TextField;
		private var colorCircle:ColorCircle;
		
		public function LifeCycle001() 
		{
			super();
			
			id = 1;
			type = "Recykling\nSkładowanie >>";
			
			addItemImage("przedmiot_Baterie");
			addItemImage("przedmiot_Siatka");
			
			colorCircle = new ColorCircle();
			colorCircle.scaleX = 0.7;
			colorCircle.scaleY = colorCircle.scaleX;
			colorCircle.color = Color.GREEN;
			colorCircle.x = 100;
			colorCircle.y = -40;
			container.addChild(colorCircle);
			
			colorCircle = new ColorCircle();
			colorCircle.scaleX = 0.7;
			colorCircle.scaleY = colorCircle.scaleX;
			colorCircle.color = Color.GREEN;
			colorCircle.x = 225;
			colorCircle.y = 40;
			container.addChild(colorCircle);
			
			colorCircle = new ColorCircle();
			colorCircle.scaleX = 0.7;
			colorCircle.scaleY = colorCircle.scaleX;
			colorCircle.color = 0xE0B0FF;
			colorCircle.x = 200;
			colorCircle.y = 200;
			container.addChild(colorCircle);
			
			colorCircle = new ColorCircle();
			colorCircle.scaleX = 0.7;
			colorCircle.scaleY = colorCircle.scaleX;
			colorCircle.color = 0xffa500;
			colorCircle.x = -30;
			colorCircle.y = 40;
			container.addChild(colorCircle);
			
			colorCircle = new ColorCircle();
			colorCircle.scaleX = 0.5;
			colorCircle.scaleY = colorCircle.scaleX;
			colorCircle.color = 0xE0B0FF;
			colorCircle.x = -20;
			colorCircle.y = 130;
			container.addChild(colorCircle);
			
			colorCircle = new ColorCircle();
			colorCircle.scaleX = 0.5;
			colorCircle.scaleY = colorCircle.scaleX;
			colorCircle.color = 0xE0B0FF;
			colorCircle.x = 5;
			colorCircle.y = 185;
			container.addChild(colorCircle);
			
			colorCircle = new ColorCircle();
			colorCircle.scaleX = 0.5;
			colorCircle.scaleY = colorCircle.scaleX;
			colorCircle.color = 0xE0B0FF;
			colorCircle.x = 50;
			colorCircle.y = 225;
			container.addChild(colorCircle);
			
			txtF = new TextField(2 * spinArrow.width / 3, 2 * spinArrow.height / 3, "cykl zagospodarowania\nZUŻYTYCH\nbaterii alkalicznych", "KarnivatFont", 25, 0xFFFFFF);
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