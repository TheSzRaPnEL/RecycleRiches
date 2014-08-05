package services
{
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class SoundController
	{
		private var musicSoundChannel:SoundChannel;
		private var musicSound:Sound;
		private var musicPausePos:Number;
		private var soundChannels:Vector.<SoundChannel>;
		private var _mute:Boolean;
		
		public function SoundController()
		{
			musicPausePos = 0;
			_mute = false;
			soundChannels = new Vector.<SoundChannel>;
		}
		
		public function playMusic(soundName:String):void
		{
			musicSound = Assets.getSound(soundName);
			musicSoundChannel = musicSound.play(musicPausePos);
			musicSoundChannel.addEventListener(Event.SOUND_COMPLETE, onMusicComplete);
		}
		
		public function resumeMusic():void
		{
			musicSoundChannel = musicSound.play(musicPausePos);
			musicSoundChannel.addEventListener(Event.SOUND_COMPLETE, onMusicComplete);
		}
		
		private function onMusicComplete(e:Event):void
		{
			musicSoundChannel = musicSound.play();
			musicSoundChannel.addEventListener(Event.SOUND_COMPLETE, onMusicComplete);
		}
		
		public function set mute(value:Boolean):void
		{
			if (value)
			{
				musicPausePos = musicSoundChannel.position;
				musicSoundChannel.removeEventListener(Event.SOUND_COMPLETE, onMusicComplete);
				musicSoundChannel.stop();
				
				for (var i:int = 0; i < soundChannels.length; i++)
				{
					if (soundChannels[0])
					{
						soundChannels[0].stop();
						soundChannels.splice(0, 1);
					}
				}
				
				_mute = true;
			}
			else
			{
				resumeMusic();
				
				_mute = false;
			}
		}
		
		public function get mute():Boolean
		{
			return _mute;
		}
		
		public function playSound(soundName:String):void
		{
			if (!_mute)
				soundChannels.push(Assets.getSound(soundName).play());
		}
	
	}
}