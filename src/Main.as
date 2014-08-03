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
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
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
		private var preloader:TextField;
		
		public function Main():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, onLoadingComplete_handler);
			loader.load(new URLRequest("splashScreen.jpg"));
		}
		
		private function onLoadingComplete_handler(e:flash.events.Event):void
		{
			splashScreen = e.target.content;
			addChild(splashScreen);
			
			var textFormat:TextFormat = new TextFormat();
			textFormat.font = "Arial";
			textFormat.size = 30;
			textFormat.align = TextFormatAlign.CENTER;
			preloader = new TextField();
			preloader.defaultTextFormat = textFormat;
			preloader.width = 250;
			preloader.autoSize = TextFieldAutoSize.CENTER;
			addChild(preloader);
			preloader.text = "0%";
			preloader.x = 512 - preloader.width / 2;
			preloader.y = 595;
			
			star = new Starling(StarlingMain, stage, stage.fullScreenSourceRect);
			star.addEventListener(starling.events.Event.CONTEXT3D_CREATE, onStarlingContext3DCreated_handler);
			star.start();
		}
		
		private function onStarlingContext3DCreated_handler(e:starling.events.Event):void
		{
			star.stage.addEventListener(starling.events.Event.COMPLETE, onStarlingReadyToShow_handler);
			star.stage.addEventListener(starling.events.Event.CHANGE, onStarlingPreloading_handler);
		}
		
		private function onStarlingPreloading_handler(e:starling.events.Event):void
		{
			preloader.text = int(100 * Number(e.data)) + "%";
		}
		
		private function onStarlingReadyToShow_handler(e:starling.events.Event):void
		{
			star.stage.removeEventListener(starling.events.Event.COMPLETE, onStarlingReadyToShow_handler);
			star.stage.removeEventListener(starling.events.Event.CHANGE, onStarlingPreloading_handler);
			
			removeChild(splashScreen);
			splashScreen = null;
			removeChild(preloader);
			preloader = null;
		}
	
	}
}