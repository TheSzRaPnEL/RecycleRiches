package components
{
	import services.Assets;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.text.TextFieldAutoSize;
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
		private var background:Quad;
		
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
			if (textfields.length)
			{
				for (var i:int = 0; i < textfields.length; i++)
				{
					removeChild(textfields[i]);
					textfields[i] = null;
				}
			}
			
			textfields.length = 0;
			
			if (arrows.length)
			{
				for (i = 0; i < arrows.length; i++)
				{
					removeChild(arrows[i]);
					arrows[i] = null;
				}
			}
			
			arrows.length = 0;
			
			if (textList.length)
			{
				var longestTxtFieldId:int = 0;
				for (i = 0; i < textList.length; i++)
				{
					if (textList[i].length > textList[longestTxtFieldId].length)
						longestTxtFieldId = i;
				}
				
				var testTxtF:TextField = new TextField(150, 32, textList[longestTxtFieldId], "GillSansMTFont", 20);
				testTxtF.vAlign = VAlign.CENTER;
				testTxtF.autoSize = TextFieldAutoSize.HORIZONTAL;
				testTxtF.autoScale = false;
				while (testTxtF.textBounds.width > 150)
				{
					testTxtF.fontSize--;
				}
				
				var smallestFont:int = testTxtF.fontSize;
				
				for (i = 0; i < textList.length; i++)
				{
					var txtF:TextField = new TextField(150, 32, "", "GillSansMTFont", smallestFont);
					txtF.autoSize = TextFieldAutoSize.HORIZONTAL;
					txtF.autoScale = false;
					txtF.vAlign = VAlign.CENTER;
					txtF.hAlign = HAlign.LEFT;
					txtF.text = textList[i];
					addChild(txtF);
					textfields.push(txtF);
					textfields[i].x = 40;
					textfields[i].y = i * 150 / textList.length;
					
					var arrow:Image = new Image(Assets.getTexture("strzalka"));
					arrow.pivotY = arrow.height / 2;
					addChild(arrow);
					arrows.push(arrow);
					arrows[i].x = 0;
					arrows[i].y = textfields[i].y + (textfields[i].textBounds.y + textfields[i].textBounds.height / 2) * textfields[i].scaleY;
				}
			}
		}
		
	}
}