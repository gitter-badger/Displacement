package com.tileisle 
{
	import org.flixel.*;
	import com.tileisle.Displacement;
	
	public class PlayState extends FlxState
	{
		[Embed(source = '../../assets/noisechecker.png')]private var ImgBG:Class;
		[Embed(source = '../../assets/protoTiles.png')]private var ImgTiles:Class;
		[Embed(source = '../../assets/waterfall.png')]private var ImgWater:Class;
		[Embed(source = '../../assets/fire.png')]private var ImgFire:Class;
		
		private var emitter:Displacement;
		private var FxGroup:FXGroup;
		
		override public function create():void
		{	
			var bg:FlxBackdrop = new FlxBackdrop(ImgBG);
			add(bg);
			
			var water:FlxSprite = new FlxSprite(100, 160, ImgWater);
			add(water);
			var fire:FlxSprite = new FlxSprite(380 - 32, 160 - 70, ImgFire);
			add(fire);
			var wallThickness:int = 16;
			var b:FlxTileblock = new FlxTileblock(0, 0, FlxG.width, wallThickness); //ceiling
			b.createGraphic(FlxG.width, wallThickness,0x88000000);
			add(b);
			b = new FlxTileblock(0, 0, wallThickness, FlxG.height); //left wall
			b.createGraphic(wallThickness, FlxG.height,0x88000000);
			add(b);
			b = new FlxTileblock(FlxG.width - wallThickness, 0, wallThickness, FlxG.height); //right wall
			b.createGraphic(wallThickness,FlxG.height,0x88000000);
			add(b);
			b = new FlxTileblock(0, FlxG.height - wallThickness, FlxG.width, wallThickness); //floor
			b.createGraphic(FlxG.width,wallThickness,0x88000000);
			add(b);
			
			FxGroup = new FXGroup;
			add(FxGroup);
			FxGroup.add(emitter = new Displacement(FxGroup.FXBuffer, 100, 160));
			emitter.setSize(32, 1);
			emitter.setXSpeed(-5, 5);
			emitter.setYSpeed( 30, 60);
			emitter.blobHeight = 4;
			emitter.blobWidth = 10;
			emitter.gravity = 0;
			emitter.displaceAmtX = 2;
			emitter.displaceAmtY = 4;
			emitter.alpha = .6;
			emitter.life = 2.5;
			emitter.blobCount = 300;

			FlxG.log(emitter.members.length);
			emitter.begin();
			
			FxGroup.add(emitter = new Displacement(FxGroup.FXBuffer, 380-32, 160));
			emitter.setSize(32, 1);
			emitter.setXSpeed(-5, 5);
			emitter.setYSpeed( -20, -60);
			emitter.blobHeight = 16;
			emitter.blobWidth = 8;
			emitter.displaceAmtX = 2;
			emitter.displaceAmtY = 3;
			emitter.alpha = .6;
			emitter.life = 2.5;
			emitter.blobCount = 300;

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