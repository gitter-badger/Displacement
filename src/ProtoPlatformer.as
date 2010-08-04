package
{
	import org.flixel.*;
	import com.tileisle.PlayState;
	[SWF(width="480", height="320", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]

	public class ProtoPlatformer extends FlxGame
	{
		public function ProtoPlatformer()
		{
			super(480, 320, PlayState, 1);
			FlxState.bgColor = 0xff000000;
		}
	}
}