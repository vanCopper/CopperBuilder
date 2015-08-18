package ide.plugins
{
	import flash.text.GridFitType;
	import flash.utils.setTimeout;
	
	import core.entities.Axis;
	import core.entities.Grid;
	import core.entities.primitives.Cube;
	import core.entities.primitives.LinesMesh;
	import core.materials.LineMaterial;
	
	import ide.MainApp;
	import ide.panel.ScenePanel;
	
	import ui.core.interfaces.IPlugin;
	
	/**
	 *
	 * @author vanCopper
	 */
	public class ScenePlugin extends Scene3D implements IPlugin
	{
		private var _scenePanel:ScenePanel;
		private var _mainApp:MainApp;
		
		
		public function ScenePlugin()
		{
			super(App.stage);
			_scenePanel 	= new ScenePanel(this);
			_scenePanel.background = false;
		}
		
		public function init(app:MainApp):void
		{
			_mainApp = app;
			_mainApp.sceneTab.addPanel(_scenePanel);
		}
		
		public function start():void
		{
			_mainApp.sceneTab.open();
			_scenePanel.update();
			_scenePanel.draw();
			
			var cube:Cube = new Cube();
			addChild(cube);
//			cube.setRotation(15, 30, 0);
			var cube1:Cube = new Cube();
			cube1.x = 50;
			cube1.z = 50;
			addChild(cube1);
			
			camera3d.setPosition(0, 50, -200);
			camera3d.lookAt(0,0,0);
			
			var axis:Axis = new Axis();
//			axis.setRotation(15, 30, 0);
			addChild(axis);
			
			var grid:Grid = new Grid();
			addChild(grid);
		}
	}
}