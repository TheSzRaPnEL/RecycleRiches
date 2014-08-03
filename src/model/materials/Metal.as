package model.materials 
{
	import model.MapPoint;
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
			lifeCycleId = 0;
			
			addInfo("1,25 Euro/kg");
			addInfo("1250 Euro/t");
			addInfo("5234 PLN/t");
			
			addMapPointId(0);
			addMapPointId(1);
			addMapPointId(2);
			addMapPointId(3);
			addMapPointId(4);
			addMapPointId(5);
		}
		
	}
}