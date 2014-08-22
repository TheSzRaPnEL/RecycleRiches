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
	public class Jarzeniowka extends Item
	{
		
		public function Jarzeniowka() 
		{
			type = ItemType.ODZYSK_I_RECYKLING;
			
			addMaterial(new Metal());
			addMaterial(new Metal());
			
			name = "ŚWIETLÓWKA";
			
			itemTexture = Assets.getTexture("przedmiot_Jarzeniowka");
		}
		
	}
}