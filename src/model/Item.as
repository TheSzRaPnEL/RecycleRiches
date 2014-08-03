package model
{
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Item
	{
		private var _itemTexture:Texture;
		private var _materialList:Vector.<Material>;
		private var _available:Boolean;
		private var _type:String;
		
		public function Item()
		{
			_materialList = new Vector.<Material>;
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
	
	}
}