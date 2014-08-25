package model
{
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Item
	{
		private var _name:String;
		private var _itemTexture:Texture;
		private var _materialList:Vector.<Material>;
		private var _available:Boolean;
		private var _type:String;
		private var _lifeCycleId:int;
		
		public function Item()
		{
			_materialList = new Vector.<Material>;
			_name = "itemName";
		}
		
		public function get type():String
		{
			return _type;
		}
		
		public function set type(value:String):void
		{
			_type = value;
		}
		
		public function get available():Boolean
		{
			return _available;
		}
		
		public function set available(value:Boolean):void
		{
			_available = value;
		}
		
		public function get materialList():Vector.<Material>
		{
			return _materialList;
		}
		
		public function addMaterial(material:Material):void
		{
			_materialList.push(material);
		}
		
		public function get itemTexture():Texture
		{
			return _itemTexture;
		}
		
		public function set itemTexture(value:Texture):void
		{
			_itemTexture = value;
		}
		
		public function get name():String 
		{
			return _name;
		}
		
		public function set name(value:String):void 
		{
			_name = value;
		}
		
		public function get lifeCycleId():int 
		{
			return _lifeCycleId;
		}
		
		public function set lifeCycleId(value:int):void 
		{
			_lifeCycleId = value;
		}
	
	}
}