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
			lifeCycleId = 2;
			
			addInfo("0,25 Euro/kg");
			addInfo("250 Euro/t");
			addInfo("250 Euro/t");
			addInfo("250 Euro/t");
			addInfo("250 Euro/t");
			addInfo("250 Euro/t");
			addInfo("250 Euro/t");
			addInfo("250 Euro/t");
			addInfo("523 PLN/t");
			addInfo("523 PLN/t");
			addInfo("523 PLN/t");
			
			addMapPointId(0);
		}
		
	}
}