package com.tileisle 
{
	import org.flixel.*;
	import com.tileisle.Displacement;
	import com.gskinner.utils.Rnd;
	
	/**
	 * @author Ryan "Rybar" Malm, Tim "SeiferTim" Hely
	 */
	public class PlayState extends FlxState
	{
		[Embed(source = '../../assets/noisechecker.png')]private var ImgBG:Class;
		[Embed(source = '../../assets/protoTiles.png')]private var ImgTiles:Class;
		[Embed(source = '../../assets/waterfall.png')]private var ImgWater:Class;
		[Embed(source = '../../assets/fire.png')]private var ImgFire:Class;
		[Embed(source = '../../assets/part.png')] private var ImgPart:Class;
		
		private var emitter:Displacement;
		private var FxGroup:FXGroup;
		private var mouseEmitter:Displacement;
		private var particles:FlxEmitter;
		private var particles2:FlxEmitter;
		
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
			
			
			add(particles = new FlxEmitter(0, 0));
			particles.createSprites(ImgPart,FlxG.width/2, 16, false);
			particles.setXSpeed( -15, 15);
			particles.setYSpeed(0, 55);
			particles.setRotation( 0, 0);
			particles.gravity = 0;
			particles.setSize(FlxG.width, 1);
			particles.start(false, 0.01);
			
			add(particles2 = new FlxEmitter(0, FlxG.height));
			particles2.createSprites(ImgPart,FlxG.width/2, 16, false);
			particles2.setXSpeed( -15, 15);
			particles2.setYSpeed(0, -55);
			particles2.setRotation( 0, 0);
			particles2.gravity = 0;
			particles2.setSize(FlxG.width, 1);
			particles2.start(false, 0.01);
			
			
			
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
			emitter.begin();
				
			
			FxGroup.add(mouseEmitter = new Displacement(FxGroup.FXBuffer,0,0));
			mouseEmitter.setSize(8, 8);
			mouseEmitter.setXSpeed(-15, 15);
			mouseEmitter.setYSpeed( -100, -150);
			mouseEmitter.blobHeight = 8;
			mouseEmitter.blobWidth = 8;
			mouseEmitter.displaceAmtX = 2;
			mouseEmitter.displaceAmtY = 2;
			mouseEmitter.alpha = .8;
			mouseEmitter.life = .4;
			mouseEmitter.blobCount = 200;
			mouseEmitter.begin();
			
			FlxG.mouse.show();
		}
		
		override public function update():void
		{
			super.update();
			mouseEmitter.x = FlxG.mouse.x-4;
			mouseEmitter.y = FlxG.mouse.y-4;
			
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