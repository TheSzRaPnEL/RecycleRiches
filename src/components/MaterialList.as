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
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class MaterialList extends Sprite
	{
		private var textfields:Vector.<MaterialTextField>;
		private var arrow:Image;
		
		public function MaterialList(materials:Vector.<Material>)
		{
			if (textfields == null)
				textfields = new Vector.<MaterialTextField>;
			
			arrow = new Image(Assets.getTexture("strzalka"));
			arrow.pivotY = arrow.height / 2;
			arrow.visible = false;
			addChild(arrow);
			
			update(materials);
		}
		
		public function update(materials:Vector.<Material>):void
		{
			for (var i:int = 0; i < materials.length; i++)
			{
				if (textfields.length > i)
				{
					textfields[i].text = String(i + 1) + ". " + materials[i].name;
					textfields[i].visible = true;
				}
				else
				{
					var txtF:MaterialTextField = new MaterialTextField(150, 75, "", "Arial", 30, 0, true);
					txtF.autoScale = true;
					txtF.vAlign = VAlign.CENTER;
					txtF.hAlign = HAlign.LEFT;
					txtF.text = String(i + 1) + ". " + materials[i].name;
					addChild(txtF);
					textfields.push(txtF);
				}
				
				textfields[i].material = materials[i];
				textfields[i].x = 30;
				textfields[i].y = i * 50;
				textfields[i].removeEventListener(TouchEvent.TOUCH, onTextFieldTouch_handler);
				textfields[i].addEventListener(TouchEvent.TOUCH, onTextFieldTouch_handler);
			}
			
			for (i = materials.length; i < textfields.length; i++)
			{
				textfields[i].visible = false;
			}
		}
		
		private function onTextFieldTouch_handler(e:TouchEvent):void
		{
			if (e.getTouch(DisplayObject(e.target)))
			{
				var touch:Touch = e.getTouch(DisplayObject(e.target));
				if (touch.phase == TouchPhase.BEGAN)
				{
					arrow.visible = true;
					arrow.y = touch.target.y + MaterialTextField(e.target).textBounds.y + MaterialTextField(e.target).textBounds.height / 2;
					Starling.current.stage.dispatchEvent(new MaterialEvent(MaterialEvent.SELECTED, false, MaterialTextField(e.target).material));
				}
			}
		}
		
		public function unselect():void
		{
			arrow.visible = false;
		}
	
	}
}