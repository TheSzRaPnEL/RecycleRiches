package model.maps 
{
	import components.Map;
	import flash.geom.Point;
	import model.MapPoint;
	import services.Assets;
	import starling.display.Image;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class MazowszeMap extends Map
	{
		
		public function MazowszeMap() 
		{
			super();
			
			var punkt:MapPoint = new MapPoint();
			punkt.position = new Point(100, 100);
			punkt.info = "Tu jest metal!";
			addMapPoint(punkt);
			
			punkt = new MapPoint();
			punkt.position = new Point(200, 200);
			punkt.info = "Tu też jest metal!";
			addMapPoint(punkt);
		}
		
	}
}