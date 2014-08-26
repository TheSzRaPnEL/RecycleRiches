package model.items
{
	import model.Item;
	import model.ItemType;
	import model.materials.Guma;
	import model.materials.KordyNylonowe;
	import services.Assets;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Opona extends Item
	{
		
		public function Opona()
		{
			lifeCycleId = 18;
			
			type = ItemType.ODZYSK;
			
			addMaterial(new Guma());
			addMaterial(new KordyNylonowe());
			
			name = "Zużyta opona";
			
			itemTexture = Assets.getTexture("przedmiot_Opona");
		}
	
	}
}