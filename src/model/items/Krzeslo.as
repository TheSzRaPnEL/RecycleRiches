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
	public class Krzeslo extends Item
	{
		
		public function Krzeslo() 
		{
			type = ItemType.ODZYSK_I_RECYKLING;
			
			addMaterial(new Metal());
			addMaterial(new Metal());
			
			name = "KRZESŁO";
			
			itemTexture = Assets.getTexture("przedmiot_Krzeslo");
		}
		
	}
}