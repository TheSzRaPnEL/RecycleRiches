package model.items 
{
	import model.Item;
	import model.ItemType;
	import model.materials.Metal;
	import services.Assets;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Garnek extends Item
	{
		
		public function Garnek() 
		{
			type = ItemType.ODZYSK;
			
			addMaterial(new Metal());
			addMaterial(new Metal());
			
			name = "GARNEK";
			
			itemTexture = Assets.getTexture("przedmiot_Garnek");
		}
		
	}
}