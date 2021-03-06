package
{
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.display.ContentDisplay;
	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.MP3Loader;
	import com.greensock.loading.XMLLoader;
	import components.SimpleButton;
	import events.InfoBtnEvent;
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
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.BitmapFont;
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
		private var soundBtnImage:Image;
		private var infoBtn:SimpleButton;
		private var infoBtnImage:Image;
		
		public function StarlingMain()
		{
			addEventListener(starling.events.Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:starling.events.Event):void
		{
			removeEventListener(starling.events.Event.ADDED_TO_STAGE, init);
			
			assetLoader = new LoaderMax();
			assetLoader.append(new XMLLoader("RR01.xml", {name: "RR01xml"}));
			assetLoader.append(new XMLLoader("RRLC00.xml", {name: "RRLC00xml"}));
			assetLoader.append(new XMLLoader("RRLC01.xml", {name: "RRLC01xml"}));
			assetLoader.append(new XMLLoader("RRLC02.xml", {name: "RRLC02xml"}));
			assetLoader.append(new XMLLoader("RRSys00.xml", {name: "RRSys00xml"}));
			assetLoader.append(new XMLLoader("RRSys01.xml", {name: "RRSys01xml"}));
			assetLoader.append(new ImageLoader("RR01.png", {name: "RR01png"}));
			assetLoader.append(new ImageLoader("RRLC00.png", {name: "RRLC00png"}));
			assetLoader.append(new ImageLoader("RRLC01.png", {name: "RRLC01png"}));
			assetLoader.append(new ImageLoader("RRLC02.png", { name: "RRLC02png" } ));
			assetLoader.append(new ImageLoader("RRSys00.png", {name: "RRSys00png"}));
			assetLoader.append(new ImageLoader("RRSys01.png", {name: "RRSys01png"}));
			assetLoader.append(new MP3Loader("gameMusic.mp3", {name: "GameMusic", autoPlay:false}));
			assetLoader.append(new MP3Loader("cancelClick.mp3", {name: "CancelClick", autoPlay:false}));
			assetLoader.append(new MP3Loader("failSound.mp3", {name: "FailSound", autoPlay:false}));
			assetLoader.append(new MP3Loader("goodSound.mp3", {name: "GoodSound", autoPlay:false}));
			assetLoader.append(new MP3Loader("normalClick.mp3", {name: "NormalClick", autoPlay:false}));
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
			
			bitmap = ContentDisplay(assetLoader.getContent("RRLC00png")).rawContent;
			xml = XML(assetLoader.getContent("RRLC00xml"));
			assetManager.addTextureAtlas("RRLC00", new TextureAtlas(Texture.fromBitmap(bitmap), xml));
			
			bitmap = ContentDisplay(assetLoader.getContent("RRLC01png")).rawContent;
			xml = XML(assetLoader.getContent("RRLC01xml"));
			assetManager.addTextureAtlas("RRLC01", new TextureAtlas(Texture.fromBitmap(bitmap), xml));
			
			bitmap = ContentDisplay(assetLoader.getContent("RRLC02png")).rawContent;
			xml = XML(assetLoader.getContent("RRLC02xml"));
			assetManager.addTextureAtlas("RRLC02", new TextureAtlas(Texture.fromBitmap(bitmap), xml));
			
			bitmap = ContentDisplay(assetLoader.getContent("RRSys00png")).rawContent;
			xml = XML(assetLoader.getContent("RRSys00xml"));
			assetManager.addTextureAtlas("RRSys00", new TextureAtlas(Texture.fromBitmap(bitmap), xml));
			
			bitmap = ContentDisplay(assetLoader.getContent("RRSys01png")).rawContent;
			xml = XML(assetLoader.getContent("RRSys01xml"));
			assetManager.addTextureAtlas("RRSys01", new TextureAtlas(Texture.fromBitmap(bitmap), xml));
			
			var music:Sound = assetLoader.getContent("GameMusic");
			assetManager.addSound("Music", music);
			
			music = assetLoader.getContent("CancelClick");
			assetManager.addSound("CancelClick", music);
			
			music = assetLoader.getContent("NormalClick");
			assetManager.addSound("NormalClick", music);
			
			music = assetLoader.getContent("FailSound");
			assetManager.addSound("FailSound", music);
			
			music = assetLoader.getContent("GoodSound");
			assetManager.addSound("GoodSound", music);
			
			assetLoader.dispose(true);
			assetLoader = null;
			
			Assets.assetManager = assetManager;
			
			screenManager = new ScreenManager();
			addChild(screenManager);
			screenManager.showScreen(0);
			
			soundController = new SoundController();
			
			infoBtn = new SimpleButton(Assets.getTexture("button_InfoOn"));
			infoBtn.x = 960;
			infoBtn.y = 22;
			infoBtn.addEventListener(starling.events.Event.TRIGGERED, onInfoBtn_handler);
			addChild(infoBtn);
			
			infoBtnImage = new Image(Assets.getTexture("button_InfoOn"));
			infoBtnImage.touchable = false;
			infoBtnImage.x = 960;
			infoBtnImage.y = 22;
			addChild(infoBtnImage);
			
			soundBtn = new SimpleButton(Assets.getTexture("button_SoundOff"), Assets.getTexture("button_SoundOff"));
			soundBtn.x = 900;
			soundBtn.y = 25;
			soundBtn.addEventListener(starling.events.Event.TRIGGERED, onSoundBtn_handler);
			addChild(soundBtn);
			
			soundBtnImage = new Image(Assets.getTexture("button_SoundOn"));
			soundBtnImage.touchable = false;
			soundBtnImage.x = 900;
			soundBtnImage.y = 25;
			addChild(soundBtnImage);
			
			Starling.current.stage.addEventListener(ScreenEvent.SHOW_SCREEN, showScreen_handler);
			Starling.current.stage.addEventListener(ScreenEvent.HIDE_SCREEN, hideScreen_handler);
			Starling.current.stage.addEventListener(ItemEvent.SELECTED, itemSelected_handler);
			Starling.current.stage.addEventListener(SoundEvent.MUTE, mute_handler);
			Starling.current.stage.addEventListener(SoundEvent.UNMUTE, unmute_handler);
			Starling.current.stage.addEventListener(InfoBtnEvent.SHOW, showInfoBtn_handler);
			Starling.current.stage.addEventListener(InfoBtnEvent.HIDE, hideInfoBtn_handler);
			Starling.current.stage.addEventListener(SoundEvent.PLAY_MUSIC, playMusic_handler);
			Starling.current.stage.addEventListener(SoundEvent.PLAY_SOUND, playSound_handler);
			
			stage.dispatchEventWith(starling.events.Event.COMPLETE);
		}
		
		private function playMusic_handler(e:SoundEvent):void 
		{
			soundController.playMusic("Music");
		}
		
		private function playSound_handler(e:SoundEvent):void 
		{
			soundController.playSound(String(e.data));
		}
		
		private function onSoundBtn_handler(e:starling.events.Event):void
		{
			soundController.mute = !soundController.mute;
			soundBtnImage.texture = soundController.mute ? Assets.getTexture("button_SoundOff") : Assets.getTexture("button_SoundOn");
			Starling.current.stage.dispatchEvent(new SoundEvent(SoundEvent.PLAY_SOUND, false, "NormalClick"));
		}
		
		private function onInfoBtn_handler(e:starling.events.Event):void
		{
			if (screenManager.infoScreenOn)
			{
				Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.HIDE_SCREEN, false, 5));
				Starling.current.stage.dispatchEvent(new InfoBtnEvent(InfoBtnEvent.SHOW));
				Starling.current.stage.dispatchEvent(new SoundEvent(SoundEvent.PLAY_SOUND, false, "NormalClick"));
			}
			else
			{
				Starling.current.stage.dispatchEvent(new ScreenEvent(ScreenEvent.SHOW_SCREEN, false, 5));
				Starling.current.stage.dispatchEvent(new InfoBtnEvent(InfoBtnEvent.HIDE));
				Starling.current.stage.dispatchEvent(new SoundEvent(SoundEvent.PLAY_SOUND, false, "CancelClick"));
			}
		}
		
		private function showInfoBtn_handler(e:InfoBtnEvent):void
		{
			infoBtnImage.texture = Assets.getTexture("button_InfoOn")
		}
		
		private function hideInfoBtn_handler(e:InfoBtnEvent):void
		{
			infoBtnImage.texture = Assets.getTexture("button_InfoOff")
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