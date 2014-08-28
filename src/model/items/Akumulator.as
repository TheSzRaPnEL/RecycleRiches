package model.items
{
	import model.Item;
	import model.ItemType;
	import model.materials.KwasSiarkowy;
	import model.materials.Olow;
	import model.materials.Polipropylen;
	import services.Assets;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Akumulator extends Item
	{
		
		public function Akumulator()
		{
			lifeCycleId = 8;
			systemId = 7;
			
			type = ItemType.ODZYSK_I_RECYKLING;
			
			addMaterial(new KwasSiarkowy());
			addMaterial(new Olow());
			addMaterial(new Polipropylen());
			
			name = "AKUMULATOR";
			
			itemTexture = Assets.getTexture("przedmiot_Akumulator");
		}
		
	}
}