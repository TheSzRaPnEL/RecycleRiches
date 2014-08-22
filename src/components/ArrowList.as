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
	public class ArrowList extends Sprite
	{
		private var textfields:Vector.<TextField>;
		private var arrows:Vector.<Image>;
		
		public function ArrowList(textList:Vector.<String>)
		{
			if (textfields == null)
				textfields = new Vector.<TextField>;
			
			if (arrows == null)
				arrows = new Vector.<Image>;
			
			update(textList);
		}
		
		public function update(textList:Vector.<String>):void
		{
			unflatten();
			
			for (var i:int = 0; i < textList.length; i++)
			{
				if (textfields.length > i)
				{
					textfields[i].text = textList[i];
					textfields[i].visible = true;
					arrows[i].visible = true;
				}
				else
				{
					var txtF:TextField = new TextField(50, 32, "", "KarnivatFont", 60);
					txtF.autoScale = true;
					txtF.vAlign = VAlign.CENTER;
					txtF.hAlign = HAlign.CENTER;
					txtF.text = textList[i];
					addChild(txtF);
					textfields.push(txtF);
					
					var arrow:Image = new Image(Assets.getTexture("strzalka"));
					arrow.pivotY = arrow.height / 2;
					addChild(arrow);
					arrows.push(arrow);
				}
				
				textfields[i].x = 50;
				textfields[i].y = i * 150 / textList.length;
				arrows[i].x = 0;
				arrows[i].y = textfields[i].y + textfields[i].textBounds.y + textfields[i].textBounds.height / 2;
			}
			
			for (i = textList.length; i < textfields.length; i++)
			{
				textfields[i].visible = false;
				arrows[i].visible = false;
			}
			
			flatten();
		}
	
	}
}