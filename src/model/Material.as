package model {
	import model.MapPoint;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Material
	{
		private var _name:String;
		private var _lifeCycleId:int;
		private var _infoList:Vector.<String>;
		private var _mapPointIdList:Vector.<int>
		
		public function Material()
		{
			_infoList = new Vector.<String>;
			_mapPointIdList = new Vector.<int>;
		}
		
		public function get mapPointIdList():Vector.<int>
		{
			return _mapPointIdList;
		}
		
		public function addMapPointId(mapPointId:int):void
		{
			mapPointIdList.push(mapPointId);
		}
		
		public function get infoList():Vector.<String>
		{
			return _infoList;
		}
		
		public function addInfo(info:String):void
		{
			infoList.push(info);
		}
		
		public function get lifeCycleId():int
		{
			return _lifeCycleId;
		}
		
		public function set lifeCycleId(value:int):void
		{
			_lifeCycleId = value;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function set name(value:String):void
		{
			_name = value;
		}
	
	}
}