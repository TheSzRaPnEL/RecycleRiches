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
	public class Spryskiwacz extends Item
	{
		
		public function Spryskiwacz() 
		{
			type = ItemType.ODZYSK_I_RECYKLING;
			
			addMaterial(new Metal());
			addMaterial(new Metal());
			
			name = "SPRYSKIACZ";
			
			itemTexture = Assets.getTexture("przedmiot_Spryskiwacz");
		}
		
	}
}