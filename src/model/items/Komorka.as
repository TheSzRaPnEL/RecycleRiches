package model.items
{
	import model.Item;
	import model.ItemType;
	import model.materials.Aluminium;
	import model.materials.Cyna;
	import model.materials.Ind;
	import model.materials.Miedz;
	import model.materials.Nikiel;
	import model.materials.Pallad;
	import model.materials.Platyna;
	import model.materials.ProcesoryCeramiczne;
	import model.materials.Srebro;
	import model.materials.Tytan;
	import model.materials.Zloto;
	import services.Assets;
	
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class Komorka extends Item
	{
		
		public function Komorka()
		{
			lifeCycleId = 16;
			systemId = 9;
			
			type = ItemType.ODZYSK_I_RECYKLING;
			
			addMaterial(new Miedz());
			addMaterial(new Aluminium());
			addMaterial(new Ind());
			addMaterial(new Zloto());
			addMaterial(new Srebro());
			addMaterial(new Platyna());
			addMaterial(new Cyna());
			addMaterial(new Tytan());
			addMaterial(new Pallad());
			addMaterial(new Nikiel());
			addMaterial(new ProcesoryCeramiczne());
			
			name = "Telefon komórkowy";
			
			itemTexture = Assets.getTexture("przedmiot_Komorka");
		}
		
	}
}