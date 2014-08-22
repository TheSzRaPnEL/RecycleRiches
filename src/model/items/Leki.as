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
	public class Leki extends Item
	{
		
		public function Leki() 
		{
			type = ItemType.ODZYSK_I_RECYKLING;
			
			addMaterial(new Metal());
			addMaterial(new Metal());
			
			name = "LEKI";
			
			itemTexture = Assets.getTexture("przedmiot_Leki");
		}
		
	}
}