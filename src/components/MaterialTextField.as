package components
{
	import model.Material;
	import starling.text.TextField;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class MaterialTextField extends TextField
	{
		private var _material:Material;
		
		public function MaterialTextField(width:int, height:int, text:String, fontName:String = "Verdana", fontSize:Number = 12, color:uint = 0x0, bold:Boolean = false)
		{
			super(width, height, text, fontName, fontSize, color, bold);
		}
		
		public function get material():Material
		{
			return _material;
		}
		
		public function set material(value:Material):void
		{
			_material = value;
		}
	
	}
}