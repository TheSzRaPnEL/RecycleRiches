package
{
	import screen.Screen001;
	import services.Assets;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.AssetManager;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class StarlingMain extends Sprite
	{
		private var assetManager:AssetManager;
		private var screen:Sprite;
		
		public function StarlingMain()
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			assetManager = new AssetManager();
			assetManager.enqueue(EmbeddedAssets);
			assetManager.verbose = true;
			
			stage.dispatchEventWith(Event.COMPLETE);
		}
		
		public function downloadAssets():void
		{
			assetManager.loadQueue(onProgress);
		}
		
		public function onProgress(ratio:Number):void
		{
			if (ratio == 1)
			{
				Assets.assetManager = assetManager;
				stage.dispatchEventWith(Event.COMPLETE);
			}
		}
		
		public function show():void
		{
			screen = new Screen001();
			addChild(screen);
		}
	
	}
}