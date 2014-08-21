package
{
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.display.ContentDisplay;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.MP3Loader;
	import com.greensock.loading.XMLLoader;
	import components.SimpleButton;
	import events.ItemEvent;
	import events.ScreenEvent;
	import events.SoundEvent;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.media.Sound;
	import model.Item;
	import services.Assets;
	import services.ScreenManager;
	import services.SoundController;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.utils.AssetManager;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class StarlingMain extends Sprite
	{
		private var assetManager:AssetManager;
		private var assetLoader:LoaderMax;
		private var screenManager:ScreenManager;
		private var soundController:SoundController;
		private var preloader:TextField;
		private var selectedItem:Item;
		private var soundBtn:SimpleButton;
		
		public function StarlingMain()
		{
			addEventListener(starling.events.Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:starling.events.Event):void
		{
			removeEventListener(starling.events.Event.ADDED_TO_STAGE, init);
			
			assetLoader = new LoaderMax();
			assetLoader.append(new XMLLoader("RR01.xml", {name: "RR01xml"}));
			assetLoader.append(new ImageLoader("RR01.png", {name: "RR01png"}));
			assetLoader.append(new MP3Loader("gameMusic.mp3", {name: "GameMusic", autoPlay:false}));
			assetLoader.load();
			assetLoader.addEventListener(LoaderEvent.PROGRESS, onFilesDownloading);
			assetLoader.addEventListener(LoaderEvent.COMPLETE, onFilesDownloaded);
			
			assetManager = new AssetManager();
		}
		
		private function onFilesDownloading(e:LoaderEvent):void
		{
			stage.dispatchEventWith(starling.events.Event.CHANGE, false, e.target.progress);
		}
		
		private function onFilesDownloaded(e:flash.events.Event):void
		{
			assetLoader.removeEventListener(LoaderEvent.PROGRESS, onFilesDownloading);
			assetLoader.removeEventListener(LoaderEvent.COMPLETE, onFilesDownloaded);
			
			var bitmap:Bitmap = ContentDisplay(assetLoader.getContent("RR01png")).rawContent;
			var xml:XML = XML(assetLoader.getContent("RR01xml"));
			
			assetManager.addTextureAtlas("RR01", new TextureAtlas(Texture.fromBitmap(bitmap), xml));
			
			var music:Sound = assetLoader.getContent("GameMusic");
			
			assetManager.addSound("Music", music);
			
			assetLoader.dispose(true);
			assetLoader = null;
			
			Assets.assetManager = assetManager;
			
			screenManager = new ScreenManager();
			addChild(screenManager);
			screenManager.showScreen(0);
			
			soundController = new SoundController();
			
			soundBtn = new SimpleButton(Assets.getTexture("button_SoundOn"), Assets.getTexture("button_SoundOff"));
			soundBtn.x = 900;
			soundBtn.y = 25;
			soundBtn.addEventListener(starling.events.Event.TRIGGERED, onSoundBtn_handler);
			addChild(soundBtn);
			
			Starling.current.stage.addEventListener(ScreenEvent.SHOW_SCREEN, showScreen_handler);
			Starling.current.stage.addEventListener(ScreenEvent.HIDE_SCREEN, hideScreen_handler);
			Starling.current.stage.addEventListener(ItemEvent.SELECTED, itemSelected_handler);
			Starling.current.stage.addEventListener(SoundEvent.MUTE, mute_handler);
			Starling.current.stage.addEventListener(SoundEvent.UNMUTE, unmute_handler);
			Starling.current.stage.addEventListener(SoundEvent.PLAY_MUSIC, playMusic_handler);
			
			stage.dispatchEventWith(starling.events.Event.COMPLETE);
		}
		
		private function playMusic_handler(e:SoundEvent):void 
		{
			soundController.playMusic("Music");
		}
		
		private function onSoundBtn_handler(e:starling.events.Event):void
		{
			soundController.mute = !soundController.mute;
		}
		
		private function mute_handler(e:SoundEvent):void
		{
			soundController.mute = true;
		}
		
		private function unmute_handler(e:SoundEvent):void
		{
			soundController.mute = false;
		}
		
		private function itemSelected_handler(e:ItemEvent):void
		{
			selectedItem = Item(e.data);
		}
		
		private function showScreen_handler(e:ScreenEvent):void
		{
			screenManager.showScreen(int(e.data));
		}
		
		private function hideScreen_handler(e:ScreenEvent):void
		{
			screenManager.hideScreen(int(e.data));
		}
	
	}
}