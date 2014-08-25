package model.items
{
	import model.Item;
	import model.ItemType;
	import model.materials.PolichlorekWinylu;
	import model.materials.Polietylen;
	import model.materials.Polipropylen;
	import services.Assets;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Spryskiwacz extends Item
	{
		
		public function Spryskiwacz()
		{
			lifeCycleId = 7;
			
			type = ItemType.ODZYSK_I_RECYKLING;
			
			addMaterial(new Polietylen());
			addMaterial(new Polipropylen());
			addMaterial(new PolichlorekWinylu());
			
			name = "SPRYSKIWACZ";
			
			itemTexture = Assets.getTexture("przedmiot_Spryskiwacz");
		}
		
	}
}