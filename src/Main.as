package
{
	//import flash.desktop.NativeApplication;
	import events.ScreenEvent;
	import events.SoundEvent;
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.net.SharedObject;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.utils.setTimeout;
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
		private var percLoaded:int;
		private var percShown:int;
		private var showStarlingAllowed:Boolean;
		private var myLoader:URLLoader;
		private var visitorNum:int;
		
		public function Main():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			var sharedObject:SharedObject = SharedObject.getLocal("RecycleRichesCookie", "/");
			if (sharedObject.data.visited==null)
			{
				var myRequest:URLRequest = new URLRequest("addVisitor.php");
			}
			else
			{
				myRequest = new URLRequest("getVisitorNum.php");
			}
			sharedObject.data.visited = true;
			sharedObject.flush();
			sharedObject.close();
			myLoader = new URLLoader();
			myLoader.addEventListener(flash.events.Event.COMPLETE, onLoad);
			myLoader.load(myRequest);
			
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, onLoadingComplete_handler);
			loader.load(new URLRequest("splashScreen.jpg"));
		}
		
		private function onLoad(evt:flash.events.Event):void
		{
			visitorNum = evt.target.data;
		}
		
		private function onLoadingComplete_handler(e:flash.events.Event):void
		{
			splashScreen = e.target.content;
			splashScreen.width = stage.stageWidth;
			splashScreen.height = 768 * splashScreen.width / 1024;
			addChild(splashScreen);
			
			var textFormat:TextFormat = new TextFormat();
			textFormat.font = "GillSansMTFont";
			textFormat.size = 30;
			textFormat.align = TextFormatAlign.CENTER;
			preloader = new TextField();
			preloader.defaultTextFormat = textFormat;
			preloader.width = splashScreen.width;
			preloader.autoSize = TextFieldAutoSize.CENTER;
			addChild(preloader);
			preloader.text = "0%";
			preloader.y = 3 * splashScreen.height / 4;
			preloader.x = splashScreen.width / 2;
			
			star = new Starling(StarlingMain, stage, new Rectangle(0, 0, splashScreen.width, splashScreen.height));
			star.addEventListener(starling.events.Event.CONTEXT3D_CREATE, onStarlingContext3DCreated_handler);
			star.start();
		}
		
		private function onStarlingContext3DCreated_handler(e:starling.events.Event):void
		{
			star.stage.stageWidth = 1024;
			star.stage.stageHeight = 768;
			star.stage.addEventListener(starling.events.Event.COMPLETE, onStarlingReadyToShow_handler);
			star.stage.addEventListener(starling.events.Event.CHANGE, onStarlingPreloading_handler);
			percLoaded = 0;
			percShown = 0;
			showStarlingAllowed = false;
			addEventListener(flash.events.Event.ENTER_FRAME, preloaderAnim_handler);
		}
		
		private function preloaderAnim_handler(e:flash.events.Event):void 
		{
			if (percLoaded > percShown && percShown != 100)
			{
				percShown++;
				preloader.text = percShown + "%";
			}
			else if (showStarlingAllowed)
			{
				removeEventListener(flash.events.Event.ENTER_FRAME, preloaderAnim_handler);
				setTimeout(showStarling, 500);
			}
		}
		
		private function allowShowStarling():void 
		{
			showStarlingAllowed = true;
		}
		
		private function onStarlingPreloading_handler(e:starling.events.Event):void
		{
			percLoaded = int(100 * Number(e.data));
		}
		
		private function onStarlingReadyToShow_handler(e:starling.events.Event):void
		{
			allowShowStarling();
		}
		
		private function showStarling():void
		{
			star.stage.removeEventListener(starling.events.Event.COMPLETE, onStarlingReadyToShow_handler);
			star.stage.removeEventListener(starling.events.Event.CHANGE, onStarlingPreloading_handler);
			
			removeChild(splashScreen);
			splashScreen = null;
			removeChild(preloader);
			preloader = null;
			
			Starling.current.stage.dispatchEvent(new SoundEvent(SoundEvent.PLAY_MUSIC));
			Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.UPDATE_VISITOR_NUM, false, visitorNum));
		}
	
	}
}