package model 
{
	import services.Assets;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class LifeCycle extends Sprite
	{
		private var _id:int;
		private var _type:String;
		private var _itemImages:Vector.<Texture>;
		protected var container:Sprite;
		protected var spinArrow:Image;
		
		public function LifeCycle() 
		{
			_itemImages = new Vector.<Texture>;
			
			container = new Sprite();
			addChild(container);
			
			spinArrow = new Image(Assets.getTexture("spinArrow"));
			container.addChild(spinArrow);
		}
		
		public function get id():int 
		{
			return _id;
		}
		
		public function set id(value:int):void 
		{
			_id = value;
		}
		
		public function get type():String 
		{
			return _type;
		}
		
		public function set type(value:String):void 
		{
			_type = value;
		}
		
		public function get itemImages():Vector.<Texture> 
		{
			return _itemImages;
		}
		
		public function addItemImage(textureName:String):void
		{
			_itemImages.push(Assets.getTexture(textureName));
		}
		
	}
}