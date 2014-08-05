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
	public class Banan extends Item
	{
		
		public function Banan() 
		{
			type = ItemType.ODZYSK_I_RECYKLING;
			
			addMaterial(new Metal());
			addMaterial(new Plastik());
			addMaterial(new Plastik());
			addMaterial(new Plastik());
			addMaterial(new Plastik());
			addMaterial(new Plastik());
			addMaterial(new Plastik());
			addMaterial(new Plastik());
			addMaterial(new Plastik());
			addMaterial(new Metal());
			addMaterial(new Plastik());
			
			itemTexture = Assets.getTexture("przedmiot_Banan");
		}
		
	}
}