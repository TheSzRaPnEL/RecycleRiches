package model.items 
{
	import model.Item;
	import model.ItemType;
	import model.materials.Metal;
	import model.materials.Plastik;
	import services.Assets;
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Siatka extends Item
	{
		
		public function Siatka() 
		{
			type = ItemType.ODZYSK_I_RECYKLING;
			
			addMaterial(new Metal());
			addMaterial(new Plastik());
			addMaterial(new Metal());
			addMaterial(new Plastik());
			addMaterial(new Metal());
			
			name = "SIATKA";
			
			itemTexture = Assets.getTexture("przedmiot_Siatka");
		}
		
	}
}