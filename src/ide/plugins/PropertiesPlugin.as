package ide.plugins
{
	import ide.MainApp;
	
	import ui.core.container.Panel;
	import ui.core.interfaces.IPlugin;
	
	/**
	 * 属性
	 * @author vanCopper
	 */
	public class PropertiesPlugin implements IPlugin
	{
		private var _mainApp:MainApp;
		private var _panel:Panel;
		
		public function PropertiesPlugin()
		{
		}
		
		public function init(app:MainApp):void
		{
			_mainApp = app;
			
			_panel = new Panel("PROPERTIES");
		}
		
		public function start():void
		{
			_mainApp.rightTab.addPanel(_panel);
			_mainApp.rightTab.open();
		}
	}
}