package components
{
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class TextFieldList extends Sprite
	{
		private var textfields:Vector.<TextField>;
		
		public function TextFieldList(textList:Vector.<String>)
		{
			if (textfields == null)
				textfields = new Vector.<TextField>;
			
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
				}
				else
				{
					var txtF:TextField = new TextField(200, 60, "", "Arial", 30, 0, true);
					txtF.autoScale = true;
					txtF.vAlign = VAlign.CENTER;
					txtF.hAlign = HAlign.CENTER;
					txtF.text = textList[i];
					addChild(txtF);
					textfields.push(txtF);
				}
				
				textfields[i].x = 50;
				textfields[i].y = (i + 1) * 250 / (textList.length + 1);
			}
			
			for (i = textList.length; i < textfields.length; i++)
			{
				textfields[i].visible = false;
			}
			
			flatten();
		}
	
	}
}