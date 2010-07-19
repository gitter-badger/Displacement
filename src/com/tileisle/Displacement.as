package com.tileisle 
{
	import flash.display.BitmapData;
	import org.flixel.*;
	
	/**
	 * <code>Displacement</code> is an emitter setup to work specificicall with DisplaceBlobs.
	 */
	public class Displacement extends FlxEmitter
	{
		private var _life:Number = -1; // how long they live
		private var _blobCount:uint = 100; // how many blobs will be created (determined by height/width)
		private var _alpha:Number = 1; // alpha of the blobs
		private var _displaceAmt:FlxPoint;
		private var _blobSize:FlxPoint; 
		private var _buffer:BitmapData;
		
		/**
		 * Creates a new <code>Displacement</code> object at a specific position.
		 * 
		 * @param	Buffer			This should point to your FXGroup's Buffer
		 * @param	X				The X position of the emitter
		 * @param	Y				The Y position of the emitter
		 * @param	Width			The Width of the emitter
		 * @param	Height			The Height of the emitter
		 * @param	MinXSpeed		Minimum X Speed of particles emitted
		 * @param	MaxXSpeed		Maximum X Speed of particles emitted
		 * @param	MinYSpeed		Minimum Y Speed of particles emitted
		 * @param	MaxYSpeed		Maximum Y speed of particles emitted
		 * @param	BlobWidth		Width of emitted Blobs
		 * @param	BlobHeight		Height of emitted Blobs
		 * @param	Life			Lifespan of emitted Blobs
		 * @param	Alpha			Alpha of emitted Blobs
		 * @param	DisplaceAmtX	Amount of Displacement on X axis
		 * @param	DisplaceAmtY	Amount of Displacement on Y axis
		 */
		public function Displacement(Buffer:BitmapData, X:Number = 0, Y:Number = 0, Width:Number = 1, Height:Number = 1, MinXSpeed:Number = 1, MaxXSpeed:Number = 1, MinYSpeed:Number = 1, MaxYSpeed:Number = 1, BlobWidth:Number = 1, BlobHeight:Number = 1, BlobCount:int=50, Life:Number = 1, Alpha:Number = 1, DisplaceAmtX:Number = 1, DisplaceAmtY:Number = 1):void
		{
			_buffer = Buffer;
			super(X, Y);
			_displaceAmt = new FlxPoint(DisplaceAmtX, DisplaceAmtY);
			if (BlobWidth < 1) BlobWidth = 1;
			if (BlobHeight < 1) BlobHeight = 1;
			_blobSize = new FlxPoint(BlobWidth, BlobHeight);
			if (Alpha > 1) Alpha = 1;
			else if (Alpha < 0.1) Alpha = 0.1;
			_alpha = Alpha;
			if (Life < -1) Life = -1;
			_life = Life;
			setSize(Width, Height);
			setXSpeed(MinXSpeed, MaxXSpeed);
			setYSpeed(MinYSpeed, MaxYSpeed);
			gravity = 0;
			setBlobCount(_blobCount);
			
			
		}
		
		public function setBlobCount(Count:int):void
		{
			/*var w:Number = width;
			var h:Number = height;
			var l:Number = _life;
			if (w < _blobSize.x) w = _blobSize.x;
			if (h < _blobSize.y) h = _blobSize.y;
			if (l < 0) l = 100;
			var p2:Number = w * h;
			var sp2:Number = _blobSize.x * _blobSize.y;
			var areas:Number = p2 / sp2;
			var numNeeded:uint = ((areas * 2) * l) * 6;
			FlxG.log(numNeeded);
			_blobCount = numNeeded;*/
			members.length = 0;
			var d:DisplaceBlob;
			for (var e:uint = 0; e < Count; e++)
			{
				
				add(d = new DisplaceBlob(_buffer,0, 0, _blobSize.x, _blobSize.y, _life, _displaceAmt.x, _displaceAmt.y));
				d.exists = false;
				
			}
		}
		
		/**
		 * Set <code>blobWidth</code> to define the width of the emitted blobs
		 */
		public function get blobWidth():Number
		{
			return _blobSize.x;
		}
		
		/**
		 * Set <code>blobWidth</code> to define the width of the emitted blobs
		 */
		public function set blobWidth(Width:Number):void
		{
			if (Width < 1) Width = 1;
			_blobSize.x = Width;
		}
		
		/**
		 * Set <code>blobHeight</code> to define the height of the emitted blobs
		 */
		public function get blobHeight():Number
		{
			return _blobSize.y;
		}
		
		/**
		 * Set <code>blobHeight</code> to define the height of the emitted blobs
		 */
		public function set blobHeight(Height:Number):void
		{
			if (Height < 1) Height = 1;
			_blobSize.y = Height;
		}
		
		/**
		 * Set <code>blobSize</code> to define the size of the emitted blobs
		 */
		public function get blobSize():FlxPoint
		{
			return _blobSize;
		}
		
		/**
		 * Set <code>blobSize</code> to define the size of the emitted blobs
		 */
		public function set blobSize(Size:FlxPoint):void
		{
			if (Size.x < 1) Size.x = 1;
			if (Size.y < 1) Size.y = 1;
			_blobSize = Size;
		}
		
		/**
		 * Set <code>alpha</code> to set the alpha of the emitted blobs.
		 */
		public function get alpha():Number
		{
			return _alpha;
		}
		
		/**
		 * Set <code>alpha</code> to set the alpha of the emitted blobs.  Valid 0.1 - 1.
		 */
		public function set alpha(Alpha:Number):void
		{
			if (Alpha > 1) Alpha = 1;
			else if (Alpha < 0.1) Alpha = 0.1;
			_alpha = Alpha;
		}
		
		/**
		 * <code>blobCount</code> is the number of Blobs the system determined it will make for this displacement
		 */
		public function get blobCount():uint
		{
			return _blobCount;
		}
		
		
		public function set blobCount(BlobCount:uint):void
		{
			_blobCount = BlobCount;
			setBlobCount(_blobCount);
		}
		
		/**
		 * Set <code>life</code> to determine the lifespan of emitted blobs
		 */
		public function get life():Number
		{
			return _life;
		}
		
		/**
		 * Set <code>life</code> to determine the lifespan of emitted blobs
		 */
		public function set life(Life:Number):void
		{
			if (Life < -1) Life = -1;
			_life = Life;
		}
		
		/**
		 * Set <code>displaceAmtX</code> to change the amount of displacement you want on the X axis.
		 */
		public function get displaceAmtX():Number
		{
			return _displaceAmt.x;
		}
		
		/**
		 * Set <code>displaceAmtX</code> to change the amount of displacement you want on the X axis.
		 */
		public function set displaceAmtX(Amt:Number):void
		{
			_displaceAmt.x = Amt;
		}
		
		/**
		 * Set <code>displaceAmtY</code> to change the amount of displacement you want on the Y axis.
		 */
		public function get displaceAmtY():Number
		{
			return _displaceAmt.y;
		}
		
		/**
		 * Set <code>displaceAmtY</code> to change the amount of displacement you want on the Y axis.
		 */
		public function set displaceAmtY(Amt:Number):void
		{
			_displaceAmt.y = Amt;
		}
		
		
		override protected function updateEmitter():void
		{
			if (!on || dead || !exists || !onScreen()) return;			
			for (var i:int = 0; i <  int(_blobCount / (_life / FlxG.elapsed)); i++)
				emitParticle();
		}
		
		/**
		 * Call this function to start emitting.
		 */
		public function begin():void
		{
			start(false, 1,0 );
		}
		
		/**
		 * Call this function to stop emitting.
		 */
		public function end():void
		{
			stop(0);
		}
		
		/**
		 * Call this function to reset the emitter
		 * @param	X	The X position of the emitter
		 * @param	Y	The Y position of the emitter
		 */
		override public function reset(X:Number, Y:Number):void
		{
			super.reset(X, Y);
			for each (var e:DisplaceBlob in members) e.rebuild(0, 0, _blobSize.x, _blobSize.y, _life, _displaceAmt.x, _displaceAmt.y);
		}
		
		/**
		 * Call this function to spit out ONE particle.
		 */
		override public function emitParticle():void
		{
			if (!onScreen()) return;
			_counter++;
			var s:DisplaceBlob = getFirstAvail() as DisplaceBlob;
			if (!s) return;			
			s.visible = true;
			s.exists = true;
			s.active = true;
			s.alpha = _alpha;
			s.blobWidth = _blobSize.x;
			s.blobHeight = _blobSize.y;
			s.life = _life;
			s.displaceAmtX = _displaceAmt.x;
			s.displaceAmtY = _displaceAmt.y;
			s.x = x - (s.width >> 1) + FlxU.random() * width;
			s.y = y - (s.height >> 1) + FlxU.random() * height;
			s.velocity.x = minParticleSpeed.x;
			if (minParticleSpeed.x != maxParticleSpeed.x) s.velocity.x += FlxU.random() * (maxParticleSpeed.x - minParticleSpeed.x);
			s.velocity.y = minParticleSpeed.y;
			if (minParticleSpeed.y != maxParticleSpeed.y) s.velocity.y += FlxU.random() * (maxParticleSpeed.y - minParticleSpeed.y);
			s.acceleration.y = gravity;
			s.angularVelocity = minRotation;
			if (minRotation != maxRotation) s.angularVelocity += FlxU.random() * (maxRotation - minRotation);
			if (s.angularVelocity != 0) s.angle = FlxU.random() * 360 - 180;
			s.drag.x = particleDrag.x;
			s.drag.y = particleDrag.y;
			s.onEmit();
			justEmitted = true;
		}
		
	}

}