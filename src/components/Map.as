package components
{
	import model.MapPoint;
	import starling.display.Image;
	import starling.display.Sprite;
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
			_mapPoints.push(mapPoint);
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