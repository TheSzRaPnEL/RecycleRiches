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
	public class BrazoweCos extends Item
	{
		
		public function BrazoweCos() 
		{
			type = ItemType.ODZYSK_I_RECYKLING;
			
			addMaterial(new Metal());
			addMaterial(new Metal());
			
			itemTexture = Assets.getTexture("przedmiot_BrazoweCos");
		}
		
	}
}