package model
{
	import flash.geom.Point;
	import services.Assets;
	import starling.display.Image;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class MapPoint extends Sprite
	{
		private var _position:Point;
		private var _info:String;
		private var container:Sprite;
		private var _point:Image;
		
		public function MapPoint()
		{
			_position = new Point();
			
			container = new Sprite();
			addChild(container);
			
			_point = new Image(Assets.getTexture("punkt"));
			point.x = point.width / 2;
			point.y = point.height / 2;
			container.addChild(point);
		}
		
		public function get position():Point
		{
			return _position;
		}
		
		public function set position(value:Point):void
		{
			_position = value;
		}
		
		public function get info():String
		{
			return _info;
		}
		
		public function set info(value:String):void
		{
			_info = value;
		}
		
		public function get point():Image
		{
			return _point;
		}
	
	}

}