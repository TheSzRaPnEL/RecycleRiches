package model.items
{
	import model.Item;
	import model.ItemType;
	import model.materials.Plexi;
	import model.materials.Polipropylen;
	import model.materials.Stal;
	import model.materials.WloknaPoliweglanowe;
	import services.Assets;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Rower extends Item
	{
		
		public function Rower()
		{
			type = ItemType.ODZYSK_I_RECYKLING;
			
			addMaterial(new Stal());
			addMaterial(new WloknaPoliweglanowe());
			addMaterial(new Polipropylen());
			addMaterial(new Plexi());
			
			name = "ROWER";
			
			itemTexture = Assets.getTexture("przedmiot_Rower");
		}
		
	}
}