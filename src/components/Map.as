package components
{
	import events.MapPointEvent;
	import model.MapPoint;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Map extends Sprite
	{
		private var container:Sprite;
		private var _map:Image;
		private var _mapPoints:Vector.<MapPoint>
		
		public function Map() 
		{
			_mapPoints = new Vector.<MapPoint>;
			
			container = new Sprite();
			addChild(container);
		}
		
		public function get map():Image 
		{
			return _map;
		}
		
		public function set map(mapImage:Image):void 
		{
			if (_map && _map.parent)
			{
				container.removeChild(_map);
				container.addChild(mapImage);
			}
				
			_map = mapImage;
		}
		
		public function get mapPoints():Vector.<MapPoint> 
		{
			return _mapPoints;
		}
		
		public function addMapPoint(mapPoint:MapPoint):void 
		{
			container.addChild(mapPoint);
			mapPoint.x = mapPoint.position.x;
			mapPoint.y = mapPoint.position.y;
			mapPoint.addEventListener(TouchEvent.TOUCH, onMapPointTouch_handler);
			_mapPoints.push(mapPoint);
		}
		
		private function onMapPointTouch_handler(e:TouchEvent):void 
		{
			if (e.getTouch(stage))
			{
				var touch:Touch = e.getTouch(stage);
				if (touch.phase == TouchPhase.HOVER)
				{
					var mapPoint:MapPoint;
					for (var i:int = 0; i < mapPoints.length; i++)
					{
						if (mapPoints[i].point == touch.target)
						{
							mapPoint = mapPoints[i];
							break;
						}
					}
					
					if (mapPoint == null)
					{
						Starling.current.stage.dispatchEvent(new MapPointEvent(MapPointEvent.MOUSE_OUT));
					}
					else
					{
						Starling.current.stage.dispatchEvent(new MapPointEvent(MapPointEvent.MOUSE_OVER, false, mapPoint));
					}
				}
			}
		}
		
		public function showMapPoint(mapPointId:int):void 
		{
			_mapPoints[mapPointId].visible = true;
		}
		
		public function hideMapPoints():void 
		{
			var i:int;
			var mapPointsNum:int = mapPoints.length;
			for (i = 0; i < mapPointsNum; i++)
			{
				mapPoints[i].visible = false;
			}
		}
		
		
		
	}
}