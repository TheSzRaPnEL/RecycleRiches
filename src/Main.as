package
{
	//import flash.desktop.NativeApplication;
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import starling.core.Starling;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Main extends Sprite
	{
		private var loader:Loader;
		private var splashScreen:Bitmap;
		private var star:Starling;
		
		public function Main():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(flash.events.Event.DEACTIVATE, deactivate);
			
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, onLoadingComplete_handler);
			loader.load(new URLRequest("splashScreen.jpg"));
		}
		
		private function onLoadingComplete_handler(e:flash.events.Event):void
		{
			splashScreen = e.target.content;
			addChild(splashScreen);
			
			star = new Starling(StarlingMain, stage, stage.fullScreenSourceRect);
			star.addEventListener(starling.events.Event.ROOT_CREATED, onStarlingRootCreated_handler);
			star.addEventListener(starling.events.Event.CONTEXT3D_CREATE, onStarlingContext3DCreated_handler);
			star.start();
		}
		
		private function onStarlingContext3DCreated_handler(e:starling.events.Event):void
		{
			star.stage.addEventListener(starling.events.Event.COMPLETE, onStarlingReadyToShow_handler);
		}
		
		private function onStarlingReadyToShow_handler(e:starling.events.Event):void
		{
			star.stage.removeEventListener(starling.events.Event.COMPLETE, onStarlingReadyToShow_handler);
			StarlingMain(star.root).downloadAssets();
			star.stage.addEventListener(starling.events.Event.COMPLETE, onAssetsLoaded_handler);
		}
		
		private function onStarlingRootCreated_handler(e:starling.events.Event):void
		{
			star.removeEventListener(starling.events.Event.ROOT_CREATED, onStarlingRootCreated_handler);
		}
		
		private function onAssetsLoaded_handler(e:starling.events.Event):void
		{
			star.stage.removeEventListener(starling.events.Event.COMPLETE, onAssetsLoaded_handler);
			removeChild(splashScreen);
			StarlingMain(star.root).show();
		}
		
		private function deactivate(e:flash.events.Event):void
		{
			//NativeApplication.nativeApplication.exit();
		}
	
	}

}