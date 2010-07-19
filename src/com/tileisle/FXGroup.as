package com.tileisle 
{
	import org.flixel.*;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	
	public class FXGroup extends FlxGroup
	{
		public var FXBuffer:BitmapData = new BitmapData(FlxG.width, FlxG.height);
		
		public function FXGroup() 
		{
			
		}
		
		override public function render():void
		{
			
		}
		
		/**
		 * Call <code>doRender</code> in the state's render function (after <code>super.render()</code>
		 */
		public function doRender():void
		{
			FXBuffer.copyPixels(FlxG.buffer, new Rectangle(0, 0, FlxG.width, FlxG.height), new Point(0, 0));
			super.render();
		}
		
	}

}