package  
{
	/**
	 * ...
	 * @author SzRaPnEL
	 */
	public class EmbeddedAssets
	{
		
		[Embed(source="../bin/RR01.png")]
		public static const RR01png:Class;
		
		[Embed(source="../bin/RR01.xml", mimeType="application/octet-stream")]
		public static const RR01xml:Class;
		
	}
}