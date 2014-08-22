package model.materials 
{
	import model.Material;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Metal extends Material
	{
		
		public function Metal() 
		{
			super();
			
			name = "Metal";
			lifeCycleId = 1;
			
			addInfo("1,25 Euro/kg");
			addInfo("1250 Euro/t");
			addInfo("5234 PLN/t");
		}
		
	}
}