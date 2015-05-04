package
{
	import flash.display.Sprite;
	import flash.events.Event;

	public class CopperBuilder extends Sprite
	{
		private var _scene3d1:Scene3D;
//		private var _scene3d2:Scene3D;
//		private var _scene3d3:Scene3D;
//		private var _scene3d4:Scene3D;
		
		
		private var _scene3d1Container:Sprite;
		public function CopperBuilder()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
		}
		
		private function onAddToStage(e:Event):void
		{
			if(this.hasEventListener(Event.ADDED_TO_STAGE))
			{
				removeEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			}
			_scene3d1Container = new Sprite();
			this.stage.addChild(_scene3d1Container);
			_scene3d1 = new Scene3D(_scene3d1Container);
//			_scene3d2 = new Scene3D(_scene3d1Container);
//			_scene3d3 = new Scene3D(_scene3d1Container);
//			_scene3d4 = new Scene3D(_scene3d1Container);
		}
	}
}