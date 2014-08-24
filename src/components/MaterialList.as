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
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class MaterialList extends Sprite
	{
		private var textfields:Vector.<MaterialTextField>;
		
		public function MaterialList(materials:Vector.<Material>)
		{
			if (textfields == null)
				textfields = new Vector.<MaterialTextField>;
			
			update(materials);
		}
		
		public function update(materials:Vector.<Material>):void
		{
			for (var i:int = 0; i < materials.length; i++)
			{
				if (textfields.length > i)
				{
					textfields[i].text = materials[i].name + " " + materials[i].price;
					textfields[i].visible = true;
				}
				else
				{
					var txtF:MaterialTextField = new MaterialTextField(300, 40, "", "KarnivatFont", 30, 0xFFFFFF, true);
					txtF.color = 0x2e6519;
					txtF.autoScale = true;
					txtF.vAlign = VAlign.CENTER;
					txtF.hAlign = HAlign.CENTER;
					txtF.text = materials[i].name + " " + materials[i].price;
					addChild(txtF);
					textfields.push(txtF);
				}
				
				textfields[i].material = materials[i];
				textfields[i].touchable = false;
				textfields[i].x = 0;
				textfields[i].y = i * 50;
			}
			
			for (i = materials.length; i < textfields.length; i++)
			{
				textfields[i].visible = false;
			}
		}
	
	}
}