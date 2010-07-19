package com.tileisle 
{
	import org.flixel.*;
	import com.tileisle.Displacement;
	
	public class PlayState extends FlxState
	{
		[Embed(source = '../../assets/noisechecker.png')]private var ImgBG:Class;
		[Embed(source = '../../assets/protoTiles.png')]private var ImgTiles:Class;
		
		private var emitter:Displacement;
		private var FxGroup:FXGroup;
		
		override public function create():void
		{	
			var bg:FlxBackdrop = new FlxBackdrop(ImgBG);
			add(bg);
			var wallThickness:int = 16;
			var b:FlxTileblock = new FlxTileblock(0, 0, FlxG.width, wallThickness); //ceiling
			b.createGraphic(FlxG.width, wallThickness);
			add(b);
			b = new FlxTileblock(0, 0, wallThickness, FlxG.height); //left wall
			b.createGraphic(wallThickness, FlxG.height);
			add(b);
			b = new FlxTileblock(FlxG.width - wallThickness, 0, wallThickness, FlxG.height); //right wall
			b.createGraphic(wallThickness,FlxG.height);
			add(b);
			b = new FlxTileblock(0, FlxG.height - wallThickness, FlxG.width, wallThickness); //floor
			b.createGraphic(FlxG.width,wallThickness);
			add(b);
			
			FxGroup = new FXGroup;
			add(FxGroup);
			FxGroup.add(emitter = new Displacement(FxGroup.FXBuffer, 100, 160));
			emitter.setSize(32, 1);
			emitter.setXSpeed(-10, 10);
			emitter.setYSpeed( -50, -100);
			emitter.blobHeight = 8;
			emitter.blobWidth = 8;
			emitter.displaceAmtX = emitter.displaceAmtY = 2;
			emitter.alpha = .7;
			emitter.blobCount = 250;

			FlxG.log(emitter.members.length);
			emitter.begin();
			
			FxGroup.add(emitter = new Displacement(FxGroup.FXBuffer, 380-32, 160));
			emitter.setSize(32, 1);
			emitter.setXSpeed(-10, 10);
			emitter.setYSpeed( -50, -100);
			emitter.blobHeight = 8;
			emitter.blobWidth = 8;
			emitter.displaceAmtX = emitter.displaceAmtY = 2;
			emitter.alpha = .7;
			emitter.blobCount = 250;

			FlxG.log(emitter.members.length);
			emitter.begin();
			
		}
		
		override public function update():void
		{
			super.update();
		}
		override public function preProcess():void
		{
			//do nothing, we're drawing a BG so the extra screen clear isn't necessary
		}
		override public function render():void
		{
			super.render();	
			FxGroup.doRender();
		}
	}
}