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
	public class Ogryzek extends Item
	{
		
		public function Ogryzek() 
		{
			type = ItemType.ODZYSK_I_RECYKLING;
			
			addMaterial(new Metal());
			addMaterial(new Metal());
			
			name = "OGRYZEK";
			
			itemTexture = Assets.getTexture("przedmiot_Ogryzek");
		}
		
	}
}