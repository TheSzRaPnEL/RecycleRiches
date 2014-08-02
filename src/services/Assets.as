package services 
{
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Assets 
	{
		private static var _assetManager:AssetManager;
		
		public function Assets() 
		{
			
		}
		
		public static function set assetManager(assetManager:AssetManager):void
		{
			_assetManager = assetManager
		}
		
		public static function getTexture(textureName:String):Texture
		{
			return _assetManager.getTexture(textureName);
		}
		
	}

}