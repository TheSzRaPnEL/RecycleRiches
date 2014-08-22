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
	public class Butelka extends Item
	{
		
		public function Butelka() 
		{
			type = ItemType.ODZYSK_I_RECYKLING;
			
			addMaterial(new Metal());
			addMaterial(new Metal());
			
			name = "BUTELKA";
			
			itemTexture = Assets.getTexture("przedmiot_Butelka");
		}
		
	}
}