package model.items
{
	import model.Item;
	import model.ItemType;
	import model.materials.Aluminium;
	import model.materials.Rtec;
	import model.materials.Szklo;
	import model.materials.Zns;
	import services.Assets;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Jarzeniowka extends Item
	{
		
		public function Jarzeniowka()
		{
			type = ItemType.ODZYSK_I_RECYKLING;
			
			addMaterial(new Rtec());
			addMaterial(new Aluminium());
			addMaterial(new Szklo());
			addMaterial(new Zns());
			
			name = "SWIETLÓWKA";
			
			itemTexture = Assets.getTexture("przedmiot_Jarzeniowka");
		}
		
	}
}