package model.items
{
	import model.Item;
	import model.ItemType;
	import model.materials.SztucznaSkora;
	import model.materials.Tekstylia;
	import services.Assets;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Mis extends Item
	{
		
		public function Mis()
		{
			lifeCycleId = 19;
			systemId = 13;
			
			type = ItemType.ODZYSK;
			
			addMaterial(new Tekstylia());
			addMaterial(new SztucznaSkora());
			
			name = "Miś";
			
			itemTexture = Assets.getTexture("przedmiot_Mis");
		}
	
	}
}