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
	public class Jogurt extends Item
	{
		
		public function Jogurt()
		{
			lifeCycleId = 12;
			
			type = ItemType.RECYKLING;
			
			addMaterial(new Polietylen());
			addMaterial(new Polipropylen());
			addMaterial(new PolichlorekWinylu());
			
			name = "Opakowanie po jogurcie";
			
			itemTexture = Assets.getTexture("przedmiot_Jogurt");
		}
		
	}
}