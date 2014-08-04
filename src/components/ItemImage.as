package components
{
	import model.Item;
	import starling.display.Image;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class ItemImage extends Image
	{
		private var _itemRef:Item;
		
		public function ItemImage(texture:Texture)
		{
			super(texture);
		}
		
		public function get itemRef():Item
		{
			return _itemRef;
		}
		
		public function set itemRef(value:Item):void
		{
			_itemRef = value;
		}
	
	}
}