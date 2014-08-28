package components
{
	import events.MaterialEvent;
	import model.Material;
	import services.Assets;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	import starling.text.TextFieldAutoSize;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class MaterialList extends Sprite
	{
		private var textfields:Vector.<MaterialTextField>;
		private var equalVerticalSpit:Boolean;
		
		public function MaterialList(materials:Vector.<Material>)
		{
			if (textfields == null)
				textfields = new Vector.<MaterialTextField>;
			
			update(materials);
		}
		
		public function update(materials:Vector.<Material>):void
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
			
			if (materials.length)
			{
				var longestTxt:String = "";
				for (i = 0; i < materials.length; i++)
				{
					var txt:String = materials[i].name + " " + materials[i].price;
					if (txt.length > longestTxt.length)
						longestTxt = txt;
				}
				
				var testTxtF:MaterialTextField = new MaterialTextField(1000, 32, longestTxt, "GillSansMTFont", 30);
				testTxtF.vAlign = VAlign.CENTER;
				testTxtF.autoScale = false;
				while (testTxtF.textBounds.width > 260)
				{
					testTxtF.fontSize--;
				}
				equalVerticalSpit = false;
				while ((testTxtF.textBounds.height + 5) * (materials.length+1) > 260)
				{
					testTxtF.fontSize--;
					equalVerticalSpit = true;
				}
				
				var smallestFont:int = testTxtF.fontSize;
				
				for (i = 0; i < materials.length; i++)
				{
					var txtF:MaterialTextField = new MaterialTextField(280, 32, "", "GillSansMTFont", smallestFont);
					txtF.vAlign = VAlign.CENTER;
					txtF.color = 0x2e6519;
					txtF.autoScale = false;
					txtF.text = materials[i].name + " " + materials[i].price;
					addChild(txtF);
					textfields.push(txtF);
					textfields[i].material = materials[i];
					textfields[i].touchable = false;
					textfields[i].x = 10;
					if (!equalVerticalSpit)
					{
						textfields[i].y = i * 50;
					}
					else
					{
						textfields[i].y = 10 + i * (textfields[i].textBounds.height + 5);
					}
				}
			}
		}
	
	}
}