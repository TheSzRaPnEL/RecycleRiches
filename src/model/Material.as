package model
{
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Material
	{
		private var _name:String;
		private var _lifeCycleId:int;
		private var _infoList:Vector.<String>;
		
		public function Material()
		{
			_infoList = new Vector.<String>;
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