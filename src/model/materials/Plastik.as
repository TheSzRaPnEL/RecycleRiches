package model.materials 
{
	import model.MapPoint;
	import model.Material;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Plastik extends Material
	{
		
		public function Plastik() 
		{
			super();
			
			name = "Plastik";
			lifeCycleId = 0;
			
			addInfo("0,25 Euro/kg");
			addInfo("250 Euro/t");
			addInfo("523 PLN/t");
			
			addMapPointId(0);
			addMapPointId(1);
			addMapPointId(2);
			addMapPointId(3);
			addMapPointId(4);
			addMapPointId(5);
		}
		
	}
}