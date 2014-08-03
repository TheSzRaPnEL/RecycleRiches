package screen 
{
	import components.Popup;
	import components.SimpleButton;
	import services.Assets;
	import starling.display.Button;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Screen002 extends Sprite
	{
		private static const itemNames:Vector.<String> = new <String>["przedmiot_Karton", "przedmiot_Sloik", "przedmiot_Kurczak", "przedmiot_Ogryzek", "przedmiot_Rura","przedmiot_Skarpeta","przedmiot_Puszka","przedmiot_UkladScalony","przedmiot_BrazoweCos","przedmiot_Butelka","przedmiot_Karton2","przedmiot_Widelec","przedmiot_Karton3","przedmiot_Szalik","przedmiot_Konserwa","przedmiot_Banan","przedmiot_ButelkaPet","przedmiot_Chleb","przedmiot_Siatka","przedmiot_Szklo"];
		
		private var container:Sprite;
		private var background:Image;
		private var items:Vector.<Image>;
		private var popupInfo:Popup;
		
		public function Screen002()
		{
			container = new Sprite();
			addChild(container);
			
			background = new Image(Assets.getTexture("screen002"));
			background.x = -2;
			background.y = -2;
			container.addChild(background);
			
			popupInfo = new Popup();
			popupInfo.visible = false;
			addChild(popupInfo);
			
			for (var i:int = 0; i < 20; i++)
			{
				var item:Image = new Image(Assets.getTexture(itemNames[i]));
				item.pivotX = item.width / 2;
				item.pivotY = item.height / 2;
				item.x = 185 + 160 * (i % 5);
				item.y = 185 + 150 * int(i / 5);
				item.addEventListener(TouchEvent.TOUCH, onItemTouch);
				container.addChild(item);
			}
		}
		
		private function onItemTouch(e:TouchEvent):void 
		{
			var touch:Touch = e.getTouch(stage);
			if (touch.phase == TouchPhase.BEGAN)
			{
				popupInfo.x = DisplayObject(e.target).x + 60;
				popupInfo.y = DisplayObject(e.target).y;
				popupInfo.visible = true;
			}
		}
		
	}
}