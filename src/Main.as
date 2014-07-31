package
{
	import flash.desktop.NativeApplication;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
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
		private var star:Starling;
		
		public function Main():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(flash.events.Event.DEACTIVATE, deactivate);
			
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			star = new Starling(StarlingMain, stage, stage.fullScreenSourceRect);
			star.addEventListener(starling.events.Event.ROOT_CREATED, onStarlingRootCreated_handler);
			star.stage.addEventListener(starling.events.Event.COMPLETE, onStarlingReadyToShow_handler);
			star.start();
		}
		
		private function onStarlingRootCreated_handler(e:starling.events.Event):void
		{
			star.removeEventListener(starling.events.Event.ROOT_CREATED, onStarlingRootCreated_handler);
		}
		
		private function onStarlingReadyToShow_handler(e:starling.events.Event):void
		{
			star.stage.removeEventListener(starling.events.Event.COMPLETE, onStarlingReadyToShow_handler);
		}
		
		private function deactivate(e:flash.events.Event):void
		{
			NativeApplication.nativeApplication.exit();
		}
	
	}

}