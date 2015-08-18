package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import ide.MainApp;

	public class CopperBuilder extends Sprite
	{
//		private var _scene3d1:Scene3D;
		
		
		private var _scene3d1Container:Sprite;
		public function CopperBuilder()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
		}
		
		private function onAddToStage(e:Event):void
		{
			this.stage.align = StageAlign.TOP_LEFT;
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			this.stage.frameRate = 60;
			addChild(new MainApp());
			
			this.stage.nativeWindow.maximize();
			this.stage.color = 0x1B1B1E;
		}
	}
}