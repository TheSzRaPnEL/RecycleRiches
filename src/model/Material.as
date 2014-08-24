package model
{
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Material
	{
		private var _name:String;
		private var _price:String;
		
		public function Material()
		{
			
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function set name(value:String):void
		{
			_name = value;
		}
		
		public function get price():String 
		{
			return _price;
		}
		
		public function set price(value:String):void 
		{
			_price = value;
		}
	
	}
}