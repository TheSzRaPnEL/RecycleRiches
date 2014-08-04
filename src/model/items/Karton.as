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
	public class Karton extends Item
	{
		
		public function Karton() 
		{
			type = ItemType.ODZYSK;
			
			addMaterial(new Metal());
			addMaterial(new Metal());
			
			itemTexture = Assets.getTexture("przedmiot_Karton");
		}
		
	}
}