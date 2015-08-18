package ide.plugins
{
	import ide.MainApp;
	
	import ui.core.container.Panel;
	import ui.core.interfaces.IPlugin;
	
	/**
	 * 层级
	 * @author vanCopper
	 */
	public class HierarchyPlugin implements IPlugin
	{
		private var _panel:Panel;
		private var _mainApp:MainApp;
		
		public function HierarchyPlugin()
		{
		}
		
		public function init(app:MainApp):void
		{
			_mainApp = app;
			
			_panel = new Panel("HIERARCHY");
		}
		
		public function start():void
		{
			_mainApp.leftTab.addPanel(_panel);
			_mainApp.leftTab.open();
		}
	}
}